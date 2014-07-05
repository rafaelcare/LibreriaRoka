class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:username, :nombre, :direccion, :telefono, :role, :email, :password, :password_confirmation)} 
  end

    #def configure_permitted_parameters
  #devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:username, :nombre, :direccion, :telefono, :role, :email, :encrypted_password)} 
  #end

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_in){|u| u.permit(:email, :password)} 
  #end
end
