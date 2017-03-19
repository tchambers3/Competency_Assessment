class Question < ActiveRecord::Base
#has_many :indicators through: :indicator_questions

  validates_presence_of :question

  # QUESTION: Should we allow some way to order the questions?:
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?",false) }
  scope :alphabetical, -> { order("question") }
  scope :by_number, -> {order("question_number")}

  #TODO: Test when indicator_questions and indicators have been made
  # scope :for_indicator, -> (indicator_id) {joins(:indicator_questions).where("indicator_questions.indicator_id = ? AND indicator_questions.question_id = id",indicator_id)}
  # scope :by_competency, -> {joins(:indicator_questions,:indicators).order("indicators.competency_id")}
  # scope :for_competency, -> (competency_id) {joins(:indicator_questions, :indicators).where("indicators.competency_id = ?", competency_id)}
end
