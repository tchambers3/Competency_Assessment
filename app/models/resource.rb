class Resource < ActiveRecord::Base

  # Relationships
  belongs_to :paradigm

  has_many :indicator_resources
  has_many :indicators, through: :indicator_resources

  # Validations
  validates_presence_of :title, :paradigm_id

  # Scopes
  scope :alphabetical, -> { order("title") }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

end
