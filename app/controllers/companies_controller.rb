class CompaniesController < ApplicationController
  before_action :authenticate_user!, :only => [:edit ,:destroy ,:new]
  # before_action :set_company, only: [:show, :apply]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create

    @company = Company.new(company_params)

    @company.user = current_user
      if @company.save
        @user = @company.user
        UserMailer.welcome_email(@user).deliver_now
        redirect_to @company
      else
        render :new
      end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to root_path, status: :see_other
  end

  def apply
    @company = Company.find(params[:id])

    if current_user.admin? && @company.user == current_user
      @company.approved = true
      @company.save
      redirect_to @company, notice: 'Successfully approved the company.'
    elsif @company.user == current_user
      @company.approved = false
      @company.save
      redirect_to @company, alert: 'Your request for approval is pending.'
    else
      redirect_to @company, alert: 'You are not authorized to apply for this company.'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :no_of_employee, :image)
  end
end
