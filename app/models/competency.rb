class Competency < ActiveRecord::Base
  # Relationships
  # has_many :indicators

  # Validations
  validates_presence_of :name
  # Only Competency should have required description
  validates_presence_of :description


  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?", false) }

end