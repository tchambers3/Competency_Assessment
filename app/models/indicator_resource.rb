class IndicatorResource < ActiveRecord::Base

  # Relationships
  belongs_to :indicator
  belongs_to :resource

  # Validations
  validates_presence_of :indicator_id, :resource_id
  validates_numericality_of :indicator_id, only_integer: true
  validates_numericality_of :resource_id, only_integer: true

  # Methods
  def self.parse(spreadsheet, indicators, resources)
    indicator_resources_sheet = spreadsheet.sheet("Indicator_Resources")
    indicator_resources_hash = 
      indicator_resources_sheet.parse(indicator_id: "Indicator_ID", resource_id: "Resource_ID")

    indicator_resources = []
    indicator_resources_hash.each_with_index do |ir, index|
      indicator_resource = IndicatorResource.new
      # Used to set the foreign keys. 
      # indicator_id and resource_id should be the id of the indicator and resource
      # relative to the row number of indicator and resource sheets
      # the offset is because of 0 indexing plus the header in the excel file
      ir[:indicator_id] = indicators[ir[:indicator_id] - 2].id
      ir[:resource_id] = resources[ir[:resource_id] - 2].id
      
      indicator_resource.attributes = ir.to_hash
      indicator_resources << indicator_resource
    end
    return indicator_resources
  end

end
