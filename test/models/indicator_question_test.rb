require 'test_helper'

class IndicatorQuestionTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:indicator)
  should belong_to(:question)

  # Basic Validations
  should validate_presence_of(:indicator_id)
  should validate_presence_of(:question_id)
  should validate_numericality_of(:indicator_id)
  should validate_numericality_of(:question_id)

  # Scope and method tests
  context "With a proper context, " do
    setup do
      create_competencies
      create_levels
      create_indicators
      create_questions
      create_indicator_questions
    end

    teardown do
      remove_competencies
      remove_levels
      remove_indicators
      remove_questions
      remove_indicator_questions
    end

    should "Show all questions for a certain competency" do
      assert_equal [@communication_q3, @communication_q2, @communication_q1], Question.for_competency(@communication.id).alphabetical
      assert_equal [@decision_making_q2, @decision_making_q1], Question.for_competency(@decision_making.id).alphabetical
      assert_equal [@problem_solving_q1], Question.for_competency(@problem_solving.id).alphabetical
    end

  end

end
