class IndicatorQuestion < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :question

  #Validations
  validate_presence_of :indicator_id, :question_id
  validate_numericality_of :indicator_id, only_integer: true
  validate_numericality_of :question_id, only_integer: true

end
