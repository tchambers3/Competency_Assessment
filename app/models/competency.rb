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

end
