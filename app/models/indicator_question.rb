class IndicatorQuestion < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :question

  #Validations
  validates_presence_of :indicator_id, :question_id
  validates_numericality_of :indicator_id, only_integer: true
  validates_numericality_of :question_id, only_integer: true

end
