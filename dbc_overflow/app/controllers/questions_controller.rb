class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # redirect_to @question
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
  end
end
