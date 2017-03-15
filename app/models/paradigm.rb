class Paradigm < ActiveRecord::Base

  #Validations
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :ranking

  #Scopes
  scope :alphabetical, -> { order("name") }
  scope :desc_rank, -> { order('ranking DESC') }
  scope :asc_rank, -> { order('ranking ASC') }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

end
