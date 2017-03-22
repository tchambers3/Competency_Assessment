class Resource < ActiveRecord::Base

  # Relationships
  has_one :paradigm
  #TODO: has many indicators through indictator_model

  # Validations
  validates_presence_of :title, :paradigm_id
  validates_uniqueness_of :title, :link

  # Scopes
  scope :alphabetical, -> { order("title") }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

end
