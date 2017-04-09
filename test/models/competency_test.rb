require 'test_helper'

class CompetencyTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:indicators)


  # Basic Validations
  should validate_presence_of(:name)
  should validate_presence_of(:description)

  should allow_value("Communication").for(:name)
  should_not allow_value("").for(:name)


  # Scope and method tests
  context "With a proper context, " do
    setup do
      create_competencies
    end

    teardown do
      remove_competencies
    end

    # Test that objects are created properly
    should "show that all factory objects are properly created" do
      assert_equal false, @communication.nil?
      assert_equal "Communication", @communication.name
      assert_equal "Decision Making", @decision_making.name
      assert_equal "Problem Solving", @problem_solving.name
    end

    # test alphabetical scope
    should "have competenices listed alphabetically" do
      assert_equal ["Communication", "Decision Making", "Problem Solving"], Competency.alphabetical.map { |e| e.name }
    end

    # test active scope
    should "have all active competencies" do
      assert_equal ["Communication", "Decision Making"], Competency.active.alphabetical.map { |e| e.name }
    end

    # test inactive scope
    should "have all inactive competencies" do
      assert_equal ["Problem Solving"], Competency.inactive.alphabetical.map { |e| e.name }
    end
  end

end
