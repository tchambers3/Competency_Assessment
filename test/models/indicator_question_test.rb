require 'test_helper'

class IndicatorQuestionTest < ActiveSupport::TestCase

  should belong_to(:indicator)
  should belong_to(:question)

  should validate_presence_of(:indicator_id)
  should validate_presence_of(:question_id)
  should validate_numericality_of(:indicator_id)
  should validate_numericality_of(:question_id)

end
