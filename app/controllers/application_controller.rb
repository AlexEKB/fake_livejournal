require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionPolicy::Unauthorized do
    redirect_to root_path, alert: "You don't have access to requested resource!"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.permit :sign_up, keys: [:first_name, :last_name]
  end
end
