class CompaniesController < ApplicationController
  before_action :authenticate_user!, :only => [:edit ,:destroy ,:new]

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

  private

  def company_params
    params.require(:company).permit(:name, :address, :no_of_employee)
  end
end
