class Paradigm < ActiveRecord::Base

  #TODO: Need to create the resource model before adding this relationship
  #Relationships
  # belongs_to :resource

  #Validations
  validates_presence_of :name, :description, :ranking
  validates_numericality_of :ranking, only_integer: true
  validates_uniqueness_of :ranking

  #Scopes
  scope :alphabetical, -> { order("name") }
  scope :asc_rank, -> { order('ranking ASC') }
  scope :desc_rank, -> { order('ranking DESC') }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

  #TODO: Implement methods for ranking alteration based on user input

end
