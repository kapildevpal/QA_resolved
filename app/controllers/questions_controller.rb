class QuestionsController < ApplicationController
  
  def index
    @job = Job.find(params[:job_id])
    @question = @job.questions
  end
  
  def new
    @job = Job.find(params[:job_id])
    @question = Question.new
    
  end
  def show
    @company = Company.find(params[:company_id])

 
    @job = Job.find(params[:job_id])
    @questions = @job.questions

  end
  

  def create
  @job = Job.find(params[:job_id])
  
    @question = Question.new(question_params.merge(job_id: @job.id))
    
    if @question.save
      flash[:notice] = "Your question is created!"

     else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
