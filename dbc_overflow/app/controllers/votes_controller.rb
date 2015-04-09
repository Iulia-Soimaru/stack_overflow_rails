class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @new_vote = @question.votes.new
    respond_to do |format|
      if @new_vote.save
        format.html { redirect_to "/questions", notice: 'Vote successfully added' }
        format.json { render json: {vote: @new_vote, question_vote: @question.votes.count }, status: :created }
      else
        format.html { render action: 'index' }
        format.json { render json: @new_vote.errors.full_messages, status: :unprocessable_entity }
      end
    # redirect_to questions_path
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @vote = Vote.where(question_id: @question.id).first
    if !(@question.votes==[])
      @delete_vote = @question.votes.last.destroy
    end
    # @delete_vote = @question.votes.last.destroy
    respond_to do |format|
      format.html { redirect_to "/questions", notice: 'Vote successfully deleted' }
      format.json { render json: {vote: @delete_vote, question_vote: @question.votes.count }, status: :created }
    end
      # if @delete_vote.destroy
      # else
      #   format.html { render action: 'index' }
      #   format.json { render json: @delete_vote.errors.full_messages, status: :unprocessable_entity }
      # end
      # redirect_to questions_path
  end

end
