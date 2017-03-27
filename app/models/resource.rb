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


  # Methods
  def self.parse(spreadsheet, paradigms)
    resources_sheet = spreadsheet.sheet("Resources")
    resources_hash = 
      resources_sheet.parse(paradigm_id: "Paradigm_ID", title: "Title/Resource", link: "Link")

    resources = []
    resources_hash.each_with_index do |r, index|
      resource = Resource.new
      # Used to set the foreign keys. 
      # paradigm_id should be the id of the paradigm relative to the row number of paradigms
      # the offset is because of 0 indexing plus the header in the excel file
      r[:paradigm_id] = paradigms[r[:paradigm_id] - 2].id
      resource.attributes = r.to_hash
      resources << resource
    end
    return resources
  end

end
