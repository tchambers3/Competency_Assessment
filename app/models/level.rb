class Level < ActiveRecord::Base
  # Relationships
  has_many :indicators

  # Validations
  validates_presence_of :name, :description, :ranking
  # The lower the ranking the higher the level
  validates_numericality_of :ranking, only_integer: true
  validates_uniqueness_of :ranking, :name


  # Scopes
  scope :alphabetical, -> { order("levels.name") }
  scope :by_ranking, -> { order("levels.ranking") }
  scope :active, -> { where("levels.active = ?", true) }
  scope :inactive, -> { where("levels.active = ?", false) }

end
