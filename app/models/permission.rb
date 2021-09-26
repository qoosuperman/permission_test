class Permission < ApplicationRecord
  belongs_to :application_resource
  has_many :permssion_group_references, class_name: 'PermissionGroupReference', dependent: :destroy
  has_many :permission_groups, through: :permssion_group_references

  validates :allowed_actions, uniqueness: { scope: :application_resource_id }

  def self.fetch_all_permissions
    all_resources = ApplicationResource.fetch_all_resources
    Permission.all.each_with_object({}) do |permission, hash|
      all_actions = all_resources[permission.application_resource_id][:actions]
      hash[permission.id] = {
        application_resource_name: all_resources[permission.application_resource_id][:name],
        allowed_actions: Admin::Permission::Bitmask.new(all_actions, permission.allowed_actions)
      }
    end
  end

  def allowed_action_names=(values)
    return if self.application_resource_id.nil?
    all_actions = self.application_resource.actions.split(',')
    self.allowed_actions = Admin::Permission::Bitmask.new(all_actions, values)
  end
end
