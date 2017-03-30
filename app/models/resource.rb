class Resource < ActiveRecord::Base

  # Relationships
  belongs_to :paradigm

  has_many :indicator_resources
  has_many :indicators, through: :indicator_resources

  # Validations
  validates_presence_of :title, :paradigm_id
  validates_numericality_of :paradigm_id, only_integer: true

  # Scopes
  scope :alphabetical, -> { order("title") }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }

  # Methods

  def full_link
    if !self.link.include?("http://")
      self.link.insert(0,"http://")
    end
    self.link
  end

end
