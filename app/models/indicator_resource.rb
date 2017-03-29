class IndicatorResource < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :resource

  # Validations
  validates_presence_of :indicator_id, :resource_id
  validates_numericality_of :indicator_id, only_integer: true
  validates_numericality_of :resource_id, only_integer: true

end
