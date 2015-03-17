class QuestionsController < ApplicationController
  def index
    @question = Question.new(params[:id])
    @question.save
    # redirect_to @question
  end

  def show
    @question = Question.find(params[:id])
  end
end
