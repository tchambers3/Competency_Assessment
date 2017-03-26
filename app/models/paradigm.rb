class Paradigm < ActiveRecord::Base

  #Relationships
  belongs_to :resource

  #Validations
  validates_presence_of :name, :description, :ranking
  validates_numericality_of :ranking, only_integer: true
  validates_uniqueness_of :ranking
  validates_uniqueness_of :name

  #Scopes
  scope :alphabetical, -> { order("name") }
  scope :by_ranking, -> { order('ranking ASC') }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

  #TODO: Implement methods for ranking alteration based on user input

end
