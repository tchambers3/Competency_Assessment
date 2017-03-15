class Paradigm < ActiveRecord::Base

  #Validations
  validates_presence_of :name
  validates_presence_of :description

  #Scopes
  scope :alphabetical, -> { order("name") }
  scope :active, -> { where("active = ?", true) }
  scope :inactive, -> { where("active = ?", false) }

end
