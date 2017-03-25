require 'roo'

class ImportsController < ApplicationController

  def parse
    file = params[:file]
    begin
      spreadsheet = open_spreadsheet(file)
    rescue => exception
      flash[:error] = "#{file.original_filename} is in the wrong format. Has to be .xls or .xlsx"
      return redirect_to root_url
    end

    competencies = parse_competencies(spreadsheet)
    levels, new_levels = parse_levels(spreadsheet)
    byebug
    if save_models(competencies, levels, new_levels)
      flash[:notice] = "Successfully uploaded and imported the #{file.original_filename} spreadsheet."
    end

    redirect_to root_url
  end


  private

  def parse_competencies(spreadsheet)
    competencies_sheet = spreadsheet.sheet("Competencies")
    competencies_hash = 
      competencies_sheet.parse(name: "Name", description: "Description")

    competencies = []
    competencies_hash.each_with_index do |c, index|
      competency = Competency.new
      competency.attributes = c.to_hash
      competencies << competency
    end
    competencies
  end

  def parse_levels(spreadsheet)
    levels_sheet = spreadsheet.sheet("Levels")
    levels_hash = 
      levels_sheet.parse(name: "Name", description: "Description", ranking: "Ranking")

    levels = []
    new_levels = []
    levels_hash.each_with_index do |l, index|
      if Level.exists?(name: l[:name])
        level = Level.find_by_name(l[:name])
      else
        level = Level.new
        level.attributes = l.to_hash
        new_levels << level
      end
      levels << level
    end
    return levels, new_levels
  end

  def save_models(competencies, levels, new_levels)
    if competencies.map(&:valid?).all? && new_levels.map(&:valid?).all?
      competencies.each(&:save!)
      new_levels.each(&:save!)
      true
    else
      flash[:error] = []
      competencies.each_with_index do |competency, index|
        competency.errors.full_messages.each do |message|
          flash[:error] << "Competencies Sheet - Row #{index+2}: #{message}"
        end
      end
      levels.each_with_index do |level, index|
        level.errors.full_messages.each do |message|
          flash[:error] << "Levels Sheet - Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def open_spreadsheet(file)
    # Using roo's library and opens up the file
    # It parses it into a Roo object (either XLS, XLSX, or CSV)
    Roo::Spreadsheet.open(file.path)
  end

end