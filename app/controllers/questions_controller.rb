class QuestionsController < ApplicationController
  
  def index
  end
  
  def new
    @job = Job.find(params[:job_id])
    @question = Question.new
    
  end
  def show
    @job = Job.find(params[:job_id])
  end
  

  def create
    @job = Job.find(params[:job_id])

    @question = Question.new(question_params.merge(job_id: @job.id))

    if @question.save
      
      redirect_to @question, notice: "Question created successfully!"
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
