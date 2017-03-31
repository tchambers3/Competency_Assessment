class Resource < ActiveRecord::Base

  # Callback Functions
  before_save :reformat_link

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
  private
    # Ensure that all links are saved with 'http://'
    # so that rails doesn't think the external links are relative links
    def reformat_link
      reg = /^https?:\/\//
      link = self.link
      if !link.match(reg)
        link.insert(0,"http://")
      end
      self.link = link
    end

end
