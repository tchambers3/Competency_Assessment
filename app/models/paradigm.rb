class Paradigm < ActiveRecord::Base

  #Relationships
  has_many :resources

  # Validations
  validates_presence_of :name, :description, :ranking
  validates_numericality_of :ranking, only_integer: true
  validates_uniqueness_of :ranking, :name

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :by_ranking, -> { order('ranking ASC') }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

  #TODO: Implement methods for ranking alteration based on user input

end
