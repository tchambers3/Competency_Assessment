require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should validate_presence_of(:question)

  should allow_value("A question?").for(:question)
  should_not allow_value("").for(:question)

  context "With a proper context, " do
    setup do
      create_questions
    end

    teardown do
      remove_questions
    end

    should "Create all factory questions" do
      assert_equal false, @communication_q1.nil?
      assert_equal "When I have something to say, I prepare by organizing my thoughts and outlining my intention.", @communication_q1.question
      assert_equal "I pay attention and focus when someone is talking to me.", @communication_q2.question
      assert_equal "I can recognize non-verbal cues from others.", @communication_q3.question
    end

    should "Show all Active Questions" do
      assert_equal [@communication_q2, @communication_q1], Question.active.alphabetical.map { |e| e }
    end

    should "Show all Inactive Questions" do
      assert_equal [@communication_q3], Question.inactive.alphabetical.map { |e| e }
    end

    should "Show in alphabetical order" do
      assert_equal [@communication_q3, @communication_q2, @communication_q1], Question.alphabetical.map { |e| e  }
    end

    should "Show in question order" do
      assert_equal [@communication_q2, @communication_q1, @communication_q3], Question.by_number.map { |e| e }
    end

  end
end
