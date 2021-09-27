class AuthedController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_authorize

  private

  def setup_authorize
    # 預設model名為controller名的單數
    authorize self.class.name.demodulize.to_s.gsub('Controller', '').singularize.constantize
  end
end