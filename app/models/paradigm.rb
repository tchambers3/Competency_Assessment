class Paradigm < ActiveRecord::Base

  #TODO: Need to create the resource model before adding this relationship
  # Relationships
  # belongs_to :resource

  # Validations
  validates_presence_of :name, :description, :ranking
  validates_numericality_of :ranking, only_integer: true
  validates_uniqueness_of :ranking
  validates_uniqueness_of :name

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :asc_rank, -> { order('ranking ASC') }
  scope :desc_rank, -> { order('ranking DESC') }
  scope :active, -> { where('active = ?', true) }
  scope :inactive, -> { where('active = ?', false) }


  # Methods
  def self.parse(spreadsheet)
    paradigms_sheet = spreadsheet.sheet("Paradigms")
    paradigms_hash = 
      paradigms_sheet.parse(name: "Name", description: "Description", ranking: "Ranking")

    paradigms = []
    new_paradigms = []
    paradigms_hash.each_with_index do |p, index|
      # Checks if a Paradigm of the same name exists
      # If it does, then set the paradigm to the existing paradigm instance
      # Else create a whole new paradigm instance and add it to the 
      # new_paradigms list in order to be saved later
      if Paradigm.exists?(name: p[:name])
        paradigm = Paradigm.find_by_name(p[:name])
      else
        paradigm = Paradigm.new
        paradigm.attributes = p.to_hash
        new_paradigms << paradigm
      end
      paradigms << paradigm
    end
    return paradigms, new_paradigms
  end

  #TODO: Implement methods for ranking alteration based on user input

end
