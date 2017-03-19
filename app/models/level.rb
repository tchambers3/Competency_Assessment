class Level < ActiveRecord::Base
  # Relationships
  has_many :indicators

  # Validations
  validates_presence_of :name
  # The lower the ranking the higher the level
  validates :ranking, presence: true, numericality: true
  # Only validate uniqueness if it is an active level
  validates_uniqueness_of :ranking, if: 'active'


  # Scopes
  scope :alphabetical, -> { order("levels.name") }
  scope :by_ranking, -> { order("levels.ranking") }
  scope :active, -> { where("levels.active = ?", true) }
  scope :inactive, -> { where("levels.active = ?", false) }

end
