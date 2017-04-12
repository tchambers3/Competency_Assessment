require 'test_helper'

class ResourceTest < ActiveSupport::TestCase

  # Test Relationships
  should belong_to(:paradigm)
  should have_many(:indicator_resources)
  should have_many(:indicators).through(:indicator_resources)

  # Test Validations
  should validate_presence_of(:title)
  should validate_presence_of(:paradigm_id)

  # Test scopes
  context "With a proper context" do
    setup do
      create_paradigms
      create_resources
    end

    teardown do
      remove_resources
      remove_paradigms
    end

    should "show that all resources are created properly" do
      assert_equal false, @comm_dumm.nil?
      assert_equal "How to Succeed in Business", @busi_success.title
      assert_equal "How to Fail in Business", @busi_failure.title
      assert_equal "Public Speaking 101 Workshop", @pub_speak.title
    end

    should "have all resources listed alphabetically" do
      assert_equal ["Communication Skills for Dummies", "How to Fail in Business", "How to Succeed in Business", "Public Speaking 101 Workshop"], Resource.alphabetical.map  { |e| e.title }
    end

    should "show links are formated properly" do
      assert_equal "http://www.google.com", @comm_dumm.link
      assert_equal "https://www.google.com", @busi_success.link
      assert_equal "", @busi_failure.link
      assert_equal nil, @pub_speak.link
    end

  end


end
