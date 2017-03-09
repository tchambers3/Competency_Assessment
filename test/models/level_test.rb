require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  # Test Relationships


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

  end
end
