require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:level)
  should belong_to(:competency)


  # Basic Validations
  should validate_presence_of(:description)
  should validate_presence_of(:level_id)
  should validate_presence_of(:competency_id)
  should validate_numericality_of(:level_id)
  should validate_numericality_of(:competency_id)

  should allow_value("Indicator 1").for(:description)
  should_not allow_value("").for(:description)

  should allow_value(1).for(:level_id)
  should_not allow_value(5.3).for(:level_id)
  should_not allow_value("").for(:level_id)
  should_not allow_value("id").for(:level_id)

  should allow_value(1).for(:competency_id)
  should_not allow_value("").for(:competency_id)
  should_not allow_value("id").for(:competency_id)
  should_not allow_value(7.5).for(:competency_id)


  # Scope and method tests
  context "With a proper context, " do
    setup do
      create_competencies
      create_levels
      create_indicators
    end

    teardown do
      remove_competencies
      remove_levels
      remove_indicators
    end

    # Test that objects are created properly
    should "show that all factory objects are properly created" do
      assert_equal false, @indicator1.nil?
      assert_equal "Able to identify common nonverbal cues.", @indicator1.description
      assert_equal "Able to present written communication in an easy–to-read format.", @indicator2.description
      assert_equal "Communication", @indicator3.competency.name
      assert_equal "Companion", @indicator4.level.name
      assert_equal false, @indicator5.active
    end

    # test alphabetical scope
    should "have indicators listed alphabetically" do
      assert_equal ["Able to identify apparent causes of a problem.", 
        "Able to identify common nonverbal cues.",
        "Able to outline a plan to gather data that will aid in the completion of a familiar task.", 
        "Able to present written communication in an easy–to-read format.", 
        "Engages in difficult conversations with others while maintaining respect."], 
        Indicator.alphabetical.map { |e| e.description }
    end

    # test by_level scope
    should "have indicators listed in order by level ranking" do
      assert_equal ["Engages in difficult conversations with others while maintaining respect.",
        "Able to identify apparent causes of a problem.",
        "Able to present written communication in an easy–to-read format.",
        "Able to identify common nonverbal cues.",
        "Able to outline a plan to gather data that will aid in the completion of a familiar task."], 
        Indicator.by_level.alphabetical.map { |e| e.description }
    end

    # test by_competency scope
    should "have indicators listed in order by competency name" do
      assert_equal ["Able to identify common nonverbal cues.",
        "Able to present written communication in an easy–to-read format.",
        "Engages in difficult conversations with others while maintaining respect.",
        "Able to outline a plan to gather data that will aid in the completion of a familiar task.",
        "Able to identify apparent causes of a problem."], 
        Indicator.by_competency.alphabetical.map { |e| e.description }
    end

    # test for_level scope
    should "have indicators listed for a certain level" do
      assert_equal ["Able to identify apparent causes of a problem.",
        "Able to present written communication in an easy–to-read format."],
        Indicator.for_level("Contributer").alphabetical.map { |e| e.description }

      assert_equal ["Engages in difficult conversations with others while maintaining respect."],
        Indicator.for_level("Champion").alphabetical.map { |e| e.description }        
    end

    # test for_description scope
    should "have indicators listed for a certain description" do
      assert_equal ["Able to identify apparent causes of a problem."],
        Indicator.for_description("Able to identify apparent causes of a problem.").alphabetical.map { |e| e.description }

      assert_equal ["Able to identify common nonverbal cues."],
        Indicator.for_description("Able to identify common nonverbal cues.").alphabetical.map { |e| e.description }        
    end

    # test for_competency scope
    should "have indicators listed for a certain competency" do
      assert_equal ["Engages in difficult conversations with others while maintaining respect.",
        "Able to present written communication in an easy–to-read format.",
        "Able to identify common nonverbal cues."],
        Indicator.for_competency("Communication").by_level.map { |e| e.description }

      assert_equal ["Able to identify apparent causes of a problem."],
        Indicator.for_competency("Problem Solving").alphabetical.map { |e| e.description }        
    end

    # test active scope
    should "have all active indicators listed" do
      assert_equal ["Able to identify common nonverbal cues.",
        "Able to outline a plan to gather data that will aid in the completion of a familiar task.", 
        "Able to present written communication in an easy–to-read format.", 
        "Engages in difficult conversations with others while maintaining respect."], 
        Indicator.active.alphabetical.map { |e| e.description }
    end

    # test inactive scope
    should "have all inactive indicators listed" do
      assert_equal ["Able to identify apparent causes of a problem."], 
        Indicator.inactive.alphabetical.map { |e| e.description }
    end

  end
end
