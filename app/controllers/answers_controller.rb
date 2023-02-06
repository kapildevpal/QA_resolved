class AnswersController < ApplicationController

def create
  
    @question = Question.find(params[:question_id])
  @answer = @question.answers.build(answer_params)
byebug
  if @answer.save
    redirect_to company_job_question_path(@question.job.company, @question.job, @question)
  else
    render 'questions/show'
  end
end
 
private

def answer_params
  params.require(:answer).permit(:content)
end

end
