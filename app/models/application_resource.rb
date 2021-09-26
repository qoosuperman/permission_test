class ApplicationResource < ApplicationRecord
  RESOURCE_NAME_MAPPING_RULES = {
    'All' => [:all]
  }.freeze

  has_many :permissions, dependent: :destroy

  def self.to_resource_names(resource_name)
    RESOURCE_NAME_MAPPING_RULES.fetch(resource_name) { resource_name.safe_constantize }
  end

  def self.fetch_all_resources
    ApplicationResource.all.each_with_object({}) do |resource, hash|
      hash[resource.id] = { name: resource.name, actions: resource.actions.split(',') }
    end
  end
end
