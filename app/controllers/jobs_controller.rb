class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
 
  def index
    
    @jobs = current_company.jobs

     
  end

  def show
    @job = Job.find(params[:id])
    @questions = @job.questions
    @company=current_company.id
    # @application = @job.applications.build(users_id: current_user)


  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.company = current_company
    if @job.save
      redirect_to company_jobs_url, notice: "Job posting was successfully created."
    else
      render :new
    end
  end

  def edit
    @job.company = current_company
    
  end

  def update
    
    if @job.update(job_params)
      redirect_to company_jobs_url, notice: "Job posting was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "Job posting was successfully deleted."
  end

  private

  def set_job
      @job = Job.find(params[:id])
    
  end

  def current_company
    @company = Company.find(params[:company_id])
   end
   
  def job_params
    params.require(:job).permit(:job_title)
  end
end
