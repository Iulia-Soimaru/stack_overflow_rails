class AnsvotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @answer.ansvotes.create
    redirect_to "/questions/#{@question.id}"
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    # @ansvote = Ansvote.where(answer_id: @answer.id)
    @answer.ansvotes.last.destroy
    redirect_to "/questions/#{@question.id}"
  end
end
