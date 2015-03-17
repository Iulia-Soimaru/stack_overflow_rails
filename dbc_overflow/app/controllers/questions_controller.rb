class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # redirect_to @question
  end

  def show
    p "*" * 100
    p params
    @question = Question.where(params[:id])
    p "*" * 100
    p params
  end
end
