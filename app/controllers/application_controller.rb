class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  # before_action :authenticate_user!,
  

  protected

  def update_allowed_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role, :company_name,:avatar)}
   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password,:role)}
  end

  def after_sign_in_path_for(resource)

    if resource.role == 'admin'
      companies_path
    else 
      emp_companies_index_path
    end
  end

   
end
