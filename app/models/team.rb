class Team < ApplicationRecord
  has_many :memberships, class_name: 'UserTeam', dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :permission_group_teams, dependent: :destroy
  has_many :permission_groups, through: :permission_group_teams
end
