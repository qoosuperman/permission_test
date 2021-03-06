# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
    @record_model = @record.model_name.to_s
  end

  def index?
    readable?
  end

  def show?
    readable?
  end

  def create?
    writable?
  end

  def new?
    create?
  end

  def update?
    writable?
  end

  def edit?
    update?
  end

  def destroy?
    writable?
  end

  def admin?
    @admin ||= @user.user_group.admin?
  end

  def readable?
    admin? || permissions.where(permission_resources: { name: @record_model }).any?
  end

  def writable?
    admin? || permissions.writable.where(permission_resources: { name: @record_model }).any?
  end

  def permissions
    @permissions ||= @user.enabled_permissions.includes(:permission_resource)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
