require 'test_helper'

class IndicatorQuestionsControllerTest < ActionController::TestCase
  # Test all IndicatorQuestionsController methods

  setup do
    create_indicators
    create_questions
    create_indicator_questions
  end

  # Test that the create action creates a valid object
  test "should create indicator_question" do
    assert_difference('IndicatorQuestion.count', 1) do
      post :create, indicator_question: { indicator: @indicator5, question: @communication_q1}
    end

    assert_redirected_to question_path(assigns(:question))
  end
  
  # Test that the create action does not create an invalid object

  # Test that the update action updates a valiid object

  # Test that the update action does not update an invalid object

  # Test that the destroy action destroys the object


end
