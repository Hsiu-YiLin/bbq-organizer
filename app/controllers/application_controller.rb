class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authorize_user, only: [:show]

  def authorize_user
  	unless current_user
  		flash[:message] = 'Please log in or register to access this page'
  	end
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
