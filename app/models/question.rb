class Question < ActiveRecord::Base
  # Relationships
#has_many :indicators through: :indicator_questions

  # Validations
  validates_presence_of :question

  # Scopes
  # QUESTION: Should we allow some way to order the questions?:
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?",false) }
  scope :alphabetical, -> { order("question") }

  #TODO: Test when indicator_questions and indicators have been made
  # scope :for_indicator, -> (indicator_id) {joins(:indicator_questions).where("indicator_questions.indicator_id = ? AND indicator_questions.question_id = id",indicator_id)}
  # scope :by_competency, -> {joins(:indicator_questions,:indicators).order("indicators.competency_id")}
  # scope :for_competency, -> (competency_id) {joins(:indicator_questions, :indicators).where("indicators.competency_id = ?", competency_id)}

  # Methods
  def self.parse(spreadsheet)
    questions_sheet = spreadsheet.sheet("Questions")
    questions_hash = 
      questions_sheet.parse(question: "Question")

    questions = []
    questions_hash.each_with_index do |q, index|
      question = Question.new
      question.attributes = q.to_hash
      questions << question
    end
    return questions
  end
end
