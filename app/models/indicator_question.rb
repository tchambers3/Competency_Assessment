class IndicatorQuestion < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :question

  # Validations
  validates_presence_of :indicator_id, :question_id
  validates_numericality_of :indicator_id, only_integer: true
  validates_numericality_of :question_id, only_integer: true

  # Methods
  def self.parse(spreadsheet, indicators, questions)
    indicator_questions_sheet = spreadsheet.sheet("Indicator_Questions")
    indicator_questions_hash = 
      indicator_questions_sheet.parse(indicator_id: "Indicator_ID", question_id: "Question_ID")

    indicator_questions = []
    indicator_questions_hash.each_with_index do |iq, index|
      indicator_question = IndicatorQuestion.new
      # Used to set the foreign keys. 
      # indicator_id and question_id should be the id of the indicator and question
      # relative to the row number of indicator and question sheets
      # the offset is because of 0 indexing plus the header in the excel file
      iq[:indicator_id] = indicators[iq[:indicator_id] - 2].id
      iq[:question_id] = questions[iq[:question_id] - 2].id
      
      indicator_question.attributes = iq.to_hash
      indicator_questions << indicator_question
    end
    return indicator_questions
  end

end
