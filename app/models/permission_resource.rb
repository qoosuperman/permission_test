class PermissionResource < ApplicationRecord
  has_many :group_permissions, dependent: :destroy
  enum default_priority: GroupPermission::PRIORITY_OPTIONS

  after_create :setup_group_sermissions

  private

  # 每增加一個 permission resource 自動幫所有的 user group 加上這個 permission
  def setup_group_sermissions
    UserGroup.all.each do |user_group|
      user_group.permission_resources += [self]
    end
  end
end
