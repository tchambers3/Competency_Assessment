require 'test_helper'

class AssessmentsControllerTest < ActionController::TestCase
  # Test all competency controller actions and methods
  setup do
    create_competencies
    create_levels
    create_indicators
    create_questions
    create_indicator_questions
    create_paradigms
    create_resources
    create_indicator_resources
  end

  # Test that the index page displays with proper variables assigned
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_competencies)
  end

  # Test the disclaimer page before taking an assessment
  test "should get disclaimer page" do
    get :disclaimer, competency_id: @communication
    assert_response :success
    assert_not_nil assigns(:competency)
  end

  # Test the take assessment page
  test "should get actual assessment" do
    post :take, competency_id: @communication, accept: true
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  # Test unsuccessful access to take assessment page
  test "should redirect to disclaimer page" do
    post :take, competency_id: @communication
    assert_redirected_to disclaimer_assessment_path
  end

  # Test generating the report action
  test "should generate the report" do
    post :generate_report, competency_id: @communication, 
                            questions: {
                              "1": {"answer": "always"}, 
                              "2": {"answer": "sometimes"}, 
                              "3": {"answer": "never"},
                              "4": {"answer": "does not apply"} 
                            }
    # Mocked out object that represents what @developing_stages should be                            
    developing_stages = Hash.new
    developing_stages[:developed] = ["1"]
    developing_stages[:developing] = ["2"]
    developing_stages[:emerging] = ["3"]
    developing_stages[:does_not_apply] = ["4"]

    assert_not_nil assigns(:developing_stages)
    assert_redirected_to report_assessment_path(competency_id: @communication, developing_stages: developing_stages)
  end

  # Test the present assessment report action
  test "should present the assessment report to the user" do
    get :report, competency_id: @communication,
                  developing_stages: {
                    "developed": ["1"],
                    "developing": ["2"],
                    "emerging": ["3"]
                  }
    assert_response :success
    assert_not_nil assigns(:developing_stages)
    assert_not_nil assigns(:indicators_resources)
    
    # Mocked out what @indicator_resources should be
    indicators_resources = Hash.new
    indicators_resources["developed"] = [@indicator2, @indicator1]
    indicators_resources["developing"] = [@indicator3]
    indicators_resources["emerging"] = [@indicator3]

    assert_equal indicators_resources, assigns(:indicators_resources)
  end
end
