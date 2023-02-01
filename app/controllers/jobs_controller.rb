class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = @company.jobs.new(job_params)
    @company = params[:company_id]
    @job.company_id = @company
    if @job.save
      redirect_to company_jobs_path(@job)
    else
      render :index
    end
  end

  private
  def job_params
     params.required(:job).permit(:job_title)

  end
end
