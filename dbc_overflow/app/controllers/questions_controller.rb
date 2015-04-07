class QuestionsController < ApplicationController
  def index
    @questions=Question.all
  end

  def create
    question = Question.create(title: params[:title], content: params[:content])
    redirect_to '/questions'
    # render :index
    # if question.save
    #   redirect_to
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
