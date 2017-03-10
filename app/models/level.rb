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
  scope :alphabetical, -> { order("name") }
  scope :by_ranking, -> { order("ranking") }
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?", false) }

end
