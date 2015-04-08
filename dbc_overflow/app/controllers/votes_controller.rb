class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @question.votes.create
    redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:question_id])
    @vote = Vote.where(question_id: @question.id)
    @question.votes.last.destroy
    redirect_to questions_path
  end

end
