module Contexts
  module IndicatorQuestionContexts

    # Create indicator questions
    def create_indicator_questions
      @indicator1_communication_q1 = FactoryGirl.create(:indicator_question, indicator: @indicator1, question: @communication_q1)
      @indicator2_communication_q1 = FactoryGirl.create(:indicator_question, indicator: @indicator2, question: @communication_q1)
      @indicator3_communication_q2 = FactoryGirl.create(:indicator_question, indicator: @indicator3, question: @communication_q2)
      @indicator3_communication_q3 = FactoryGirl.create(:indicator_question, indicator: @indicator3, question: @communication_q3)
      @indicator4_decision_making_q1 = FactoryGirl.create(:indicator_question, indicator: @indicator4, question: @decision_making_q1)
      @indicator4_decision_making_q2 = FactoryGirl.create(:indicator_question, indicator: @indicator4, question: @decision_making_q2)
      @indicator5_problem_solving_q1 = FactoryGirl.create(:indicator_question, indicator: @indicator5, question: @problem_solving_q1)
    end

    # Destroy the indicator question objects
    def remove_indicator_questions
      @indicator1_communication_q1.destroy
      @indicator2_communication_q1.destroy
      @indicator3_communication_q2.destroy
      @indicator3_communication_q3.destroy
      @indicator4_decision_making_q1.destroy
      @indicator4_decision_making_q2.destroy
      @indicator5_problem_solving_q1.destroy
    end
    
  end
end