class QuestionsController < ApplicationController
  def index
    @in=Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path
  end

private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
