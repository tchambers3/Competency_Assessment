class IndicatorResource < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :resource

  # Validations
  validate_presence_of :indicator_id, :resource_id
  validate_numericality_of :indicator_id, only_integer: true
  validate_numericality_of :resource_id, only_integer: true

end
