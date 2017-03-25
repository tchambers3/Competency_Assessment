require 'roo'

class ImportsController < ApplicationController

  def parse
    file = params[:file]
    # Check if the the file is of the right type.
    # Redirect to the original upload url early if it's not correct.
    begin
      spreadsheet = open_spreadsheet(file)
    rescue => exception
      flash[:error] = "#{file.original_filename} is in the wrong format. Has to be .xls or .xlsx"
      return redirect_to root_url
    end

    # Parses each of the sheets
    # Returns a list of ActiveRecords that need to be saved into the database
    # For specific models like Level, it returns a list of all levels listed in 
    # the Excel file as well as the the list of new objects that need to be saved.
    # This is because the same exact levels will generally be in every Excel file, but
    # we don't need to redundantly save it into the database each time. 
    competencies = parse_competencies(spreadsheet)
    levels, new_levels = parse_levels(spreadsheet)
    
    # Validate that the new models are all valid and save them to the database.
    # If any of the new models are not valid, the aggregate_errors method will be
    # called to aggregate all the errors that need to be fixed.
    unless validate_save_models([competencies, new_levels])
      aggregate_errors([competencies, levels])
      return redirect_to root_url
    end

    # Because these following models are dependent on the id's and creation of the previous models,
    # they have to be parsed afterwards, validated and saved.
    indicators = parse_indicators(spreadsheet, competencies, levels)

    unless validate_save_models([indicators])
      rollback_saved_models([competencies, new_levels])
      aggregate_errors([indicators])
      return redirect_to root_url
    end

    # Redirect to the original page with success message if no errors have occurred in any of the models
    flash[:notice] = "Successfully uploaded and imported the #{file.original_filename} spreadsheet."
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
    return competencies
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

  def parse_indicators(spreadsheet, competencies, levels)
    indicators_sheet = spreadsheet.sheet("Indicators")
    indicators_hash = 
      indicators_sheet.parse(level_id: "Level_ID", description: "Description")

    indicators = []
    indicators_hash.each_with_index do |i, index|
      indicator = Indicator.new
      i[:competency_id] = competencies[0].id
      i[:level_id] = levels[i[:level_id] - 2].id
      indicator.attributes = i.to_hash
      indicators << indicator
    end
    return indicators
  end

  # Takes in the list of all models that need to be saved into the database.
  # Checks if the new objects are valid, before saving into the databse.
  # Nothing is saved unless everything is valid.
  #
  # Note: Stops after the first sheet that encounters and error, therefore, error messages
  # will only be for the first sheet that has errors, not error messages for all sheets.
  def validate_save_models(models_list)
    # Goes through all the models and see if its valid
    # returns false if any of them are invalid
    models_list.each do |models|
      unless models.map(&:valid?).all?
        return false
      end
    end
    # If all are valid, then save them and return true
    models_list.each do |models|
      models.each(&:save!)
    end
    return true
  end

  # This method is called if an error exists in the list of models.
  # Goes through all the models in order to aggregate the errors into flash[:error]
  # Didn't use the new models (ex. new_levels vs. levels) because of Row #'s for error message.
  def aggregate_errors(models_list)
    flash[:error] = []
    models_list.each do |models|
      models.each_with_index do |m, index|
        m.errors.full_messages.each do |message|
          flash[:error] << "#{m.class.name.pluralize} Sheet - Row #{index+2}: #{message}"
        end
      end
    end
  end

  # This what will be called if any of the models were created and later on models
  # had an error. We will need to delete the already created models.
  def rollback_saved_models(models_list)
    models_list.each do |models|
      models.each(&:destroy!)
    end
  end

  def open_spreadsheet(file)
    # Using roo's library and opens up the file
    # It parses it into a Roo object (either XLS, XLSX, or CSV)
    Roo::Spreadsheet.open(file.path)
  end

end