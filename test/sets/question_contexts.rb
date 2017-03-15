module Question
  module QuestionContexts

    # Create three Questions
    def create_questions
      @communication_q1 = FactoryGirl.create(:question)
      @communication_q2 = FactoryGirl.create(:question, question: "I pay attention and focus when someone is talking to me.")
      @communication_q3 = FactoryGirl.create(:question, question: "I can recognize non-verbal cues from others.", active: false)
    end

    # Destroy the question objects
    def remove_questions
      @communication_q1.destroy
      @communication_q2.destroy
      @communication_q3.destroy
    end

  end
end
