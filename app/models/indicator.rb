class Indicator < ActiveRecord::Base
  # Relationships
  belongs_to :competency
  belongs_to :level

  # Validations
  validates_presence_of :competency_id, :level_id, :description
  validates_numericality_of :competency_id, only_integer: true
  validates_numericality_of :level_id, only_integer: true

  # Scopes
  scope :alphabetical, -> { order("description") }
  scope :by_level, -> { joins(:level).order("levels.ranking") }
  scope :by_competency, -> { joins(:competency).order("competencies.name") }
  scope :for_level, -> (level) { joins(:level).where("name LIKE ?", level) }
  scope :for_description, -> (desc) { where("description LIKE ?", desc) }
  scope :for_competency, -> (competency) { joins(:competency).where("name LIKE ?", competency) }
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?", false) }

end
