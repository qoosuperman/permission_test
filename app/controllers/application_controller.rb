class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied, with: :user_access_denied

  def user_access_denied
    render file: 'public/401.html', status: :unauthorized
  end
end
