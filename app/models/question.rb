class Question < ActiveRecord::Base
#has_many :indicators through: :indicator_questions

  validates_presence_of :question

  # QUESTION: Should we allow some way to order the questions?:
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?",false) }

end
