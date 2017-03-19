require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:indicators)

  # Basic Validations
  should validate_presence_of(:name)
  should validate_presence_of(:ranking)
  should validate_uniqueness_of(:ranking)
  should validate_numericality_of(:ranking)

  should allow_value("Champion").for(:name)
  should_not allow_value("").for(:name)
  should allow_value(1).for(:ranking)
  should_not allow_value("").for(:ranking)
  should_not allow_value("Level1").for(:ranking)


  # Scope and method tests
  context "With a proper context, " do
    setup do
      create_levels
    end

    teardown do
      remove_levels
    end

    # Test that objects are created properly
    should "show that all factory objects are properly created" do
      assert_equal false, @novice.nil?
      assert_equal "Contributer", @contributer.name
      assert_equal "Champion", @champion.name
      assert_equal "Companion", @companion.name
    end

    # test uniqueness of ranking
    should "not be able to create a Level with an existing ranking" do
      bad_level = FactoryGirl.build(:level, name: "Bad Level", ranking: 3)
      deny bad_level.valid?
    end

    # test uniqueness of ranking for inactive levels
    should "be able to create a Level with an existing ranking if level is inactive" do
      bad_level = FactoryGirl.build(:level, name: "Bad Level", ranking: 3, active: false)
      assert bad_level.valid?
    end

    # test alphabetical scope
    should "have levels listed alphabetically" do
      assert_equal ["Champion", "Companion", "Contributer", "Novice"], Level.alphabetical.map { |e| e.name }
    end

    # test by_ranking scope
    should "have levels listed by ranking" do
      assert_equal ["Champion", "Contributer", "Companion", "Novice"], Level.by_ranking.map { |e| e.name }
    end

    # test active scope
    should "have all active levels" do
      assert_equal ["Champion", "Companion", "Contributer"], Level.active.alphabetical.map { |e| e.name }
    end

    # test inactive scope
    should "have all inactive levels" do
      assert_equal ["Novice"], Level.inactive.alphabetical.map { |e| e.name }
    end
  end
end
