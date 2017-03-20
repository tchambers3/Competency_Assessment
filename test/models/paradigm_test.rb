require 'test_helper'

class ParadigmTest < ActiveSupport::TestCase

  #TODO: test relationship once its added

  # Validation tests
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:ranking)
  should validate_numericality_of(:ranking)
  should validate_uniqueness_of(:ranking)

  context "With a proper context," do
    setup do
      create_paradigms
    end

    teardown do
      remove_paradigms
    end

    should "Create all test objects properly" do
      assert_equal false, @build_understanding.nil?
      assert_equal "Do Something", @do_something.name
      assert_equal "Get Connected", @get_connected.name
      assert_equal "Learn More", @learn_more.name
    end
    
  end

end
