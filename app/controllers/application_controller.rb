class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  # before_action :authenticate_user!,
  helper_method :current_company




  # before_action :set_job

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    @application.job = @job

    if @application.save
      redirect_to @job, notice: "Your application was successfully submitted."
    else
      render "jobs/show"
    end
  end

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
   
  def current_company
    @company = Company.find(params[:company_id])
   end

   private
   

  def application_params
    params.require(:application).permit(:cover_letter)
  end
  end
