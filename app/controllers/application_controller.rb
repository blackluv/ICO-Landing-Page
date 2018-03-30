class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # redirect user after succesful sign in
  def after_sign_in_path_for(resource)
    home_minor_path
  end

  protected

  #permit parameters for sign up and edit
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_name])

  end

end