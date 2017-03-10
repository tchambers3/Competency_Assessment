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
  should_not allow_value("").for(:level_id)
  should_not allow_value("id").for(:level_id)
  should allow_value(1).for(:competency_id)
  should_not allow_value("").for(:competency_id)
  should_not allow_value("id").for(:level_id)
end
