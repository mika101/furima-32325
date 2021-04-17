class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configuration_permitted_parameters, if: :devise_controller?

  private
  def configuration_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birthday])
  end
end
