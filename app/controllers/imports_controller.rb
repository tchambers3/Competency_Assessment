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

    save_models(competencies)

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

  def save_models(competencies)
    if competencies.map(&:valid?).all?
      competencies.each(&:save!)
      true
    else
      flash[:error] = []
      competencies.each_with_index do |competency, index|
        competency.errors.full_messages.each do |message|
          flash[:error] << "Row #{index+2}: #{message}"
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