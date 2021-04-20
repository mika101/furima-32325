class ApplicationController < ActionController::Base
  before_action :configuration_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(_resource)
    root_path
  end

  private

  def configuration_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_furigana,
                                             :first_name_furigana, :birthday])
  end
end
