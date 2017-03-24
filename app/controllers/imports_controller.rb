require 'roo'

class ImportsController < ApplicationController

  def parse
    file = params[:file]
    spreadsheet = open_spreadsheet(file)

    redirect_to root_url
  end

  def open_spreadsheet(file)
    # Using roo's library and opens up the file
    # It parses it into a Roo object (either XLS, XLSX, or CSV)
    Roo::Spreadsheet.open(file.path)
  end

end