require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:level)
  should belong_to(:competency)

  
end
