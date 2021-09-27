class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books

  has_many :memberships, class_name: 'UserTeam', dependent: :destroy
  has_many :teams, through: :memberships

  def all_abilities
    all_permissions = ::Permission.fetch_all_permissions

    team_permissions = teams.flat_map do |team|
      permissions_of(team, all_permissions)
    end

    team_permissions.inject do |all, permissions_of_group|
      all.merge(permissions_of_group) { |_, previous_group, next_group| (previous_group + next_group).uniq }
    end
  end

  private

  def permissions_of(user_or_team, all_permissions)
    user_or_team.permission_groups.includes(:permissions).where(enabled: true).map do |permission_group|
      permission_group.permissions.pluck(:id).each_with_object({}) do |id, hash|
        hash[all_permissions[id][:application_resource_name]] ||= []
        (hash[all_permissions[id][:application_resource_name]] += all_permissions[id][:allowed_actions]).uniq!
      end
    end
  end
end