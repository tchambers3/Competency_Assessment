require 'test_helper'

class ParadigmTest < ActiveSupport::TestCase

  # Relationships
  should have_many(:resources)

  # Validation tests
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:ranking)
  should validate_numericality_of(:ranking)
  should validate_uniqueness_of(:ranking)
  should validate_uniqueness_of(:name)

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

    # test alphabetical scope
    should "Show paradigms in alphabetical order" do
      assert_equal ["Build Understanding", "Do Something", "Get Connected", "Learn More"], Paradigm.alphabetical.map { |e| e.name}
    end

    # test by_ranking scope
    should "Show paradigms in ascending ranking" do
      assert_equal ["Build Understanding", "Get Connected", "Do Something", "Learn More"], Paradigm.by_ranking.map { |e| e.name}
    end

  end

end
