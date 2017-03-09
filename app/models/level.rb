class Level < ActiveRecord::Base
  # Relationships
  # has_many :indicators

  # Validations
  validates_presence_of :name
  # The lower the ranking the higher the level
  validates :ranking, presence: true, uniqueness: true, numericality: true


  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :by_ranking, -> { order("ranking") }
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?", false) }

end
