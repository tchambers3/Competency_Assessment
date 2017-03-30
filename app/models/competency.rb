class Competency < ActiveRecord::Base
  # Relationships
  has_many :indicators

  # Validations
  validates_presence_of :name
  validates_presence_of :description


  # Scopes
  scope :alphabetical, -> { order("competencies.name") }
  scope :active, -> { where("competencies.active = ?", true) }
  scope :inactive, -> { where("competencies.active = ?", false) }


  # Methods
  def self.parse(spreadsheet)
    competencies_sheet = spreadsheet.sheet("Competencies")
    competencies_hash = 
      competencies_sheet.parse(name: "Name", description: "Description")

    competencies = []
    competencies_hash.each_with_index do |c, index|
      competency = Competency.new
      competency.attributes = c.to_hash
      competencies << competency
    end
    return competencies
  end

end
