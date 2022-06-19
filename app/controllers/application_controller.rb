class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource)
    case resource
    when User
      posts_path
    when Admin
      admin_posts_path
    end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:first_name,:first_name_kana,:last_name_kana])
  end
end
