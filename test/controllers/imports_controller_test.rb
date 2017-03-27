require 'test_helper'

class ImportsControllerTest < ActionController::TestCase

  # Test that uploading a xlsx file, parsing it properly, and saving to database works
  test "should properly parse and import a correct xlsx file" do
    assert_differences([['Competency.count', 1], ['Level.count', 3], 
      ['Indicator.count', 24], ['Paradigm.count', 6], ['Resource.count', 100],
      ['IndicatorResource.count', 110], ['Question.count', 11], ['IndicatorQuestion.count', 29]]) do

      uploaded_file = ActionDispatch::Http::UploadedFile.new({
          :tempfile => File.new(Rails.root.join("test/fixtures/files/competencies.xlsx"))
      })
      uploaded_file.original_filename = "competencies.xlsx"
      post :parse, file: uploaded_file
    end

    assert_redirected_to root_path
  end

end