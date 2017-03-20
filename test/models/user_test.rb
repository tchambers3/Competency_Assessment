require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:username)
  should validate_uniqueness_of(:username)

  context "With a proper context, " do
    setup do
      create_user
    end

    teardown do
      remove_user
    end

  end
end
