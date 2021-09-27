class GroupPermission < ApplicationRecord
  PRIORITY_OPTIONS = {
    disable: 0,
    readable: 1,
    writable: 2
  }
  belongs_to :user_group
  belongs_to :permission_resource
  scope :enable, -> { where('group_permissions.priority > 0') }
  enum priority: PRIORITY_OPTIONS

  before_create :setup_priority

  private

  def setup_priority
    self.priority = permission_resource.default_priority if priority.nil?
  end
end
