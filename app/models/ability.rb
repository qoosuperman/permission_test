# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    # can :manage, :all if user.admin?
    # can :read, TeamUtility # TODO: current everyone has permission to read it
    return unless user.all_abilities.present?

    user.all_abilities.each do |application_resource_name, actions|
      can(actions, ApplicationResource.to_resource_names(application_resource_name))
    end
  end
end
