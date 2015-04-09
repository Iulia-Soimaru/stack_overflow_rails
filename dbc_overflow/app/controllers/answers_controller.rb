class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    p "*" * 90
    p params
    p "#" * 90
    p answer_params
    @new_answer = @question.answers.build(answer_params)
    respond_to do |format|
      if @new_answer.save
        format.html { redirect_to "/questions/#{@question.id}", notice: 'Answer successfully created' }
        format.json { render json: {answer: @new_answer, votes: @new_answer.ansvotes }, status: :created }
      else
        format.html { render action: 'show' }
        format.json { render json: @new_answer.errors.full_messages, status: :unprocessable_entity }
      end
    end


# respond_to do |format|
#       if @question.save
#         format.html { redirect_to '/questions', notice: 'Question successfully created' }
#         format.json { render json: {question: @question, votes: @question.votes }, status: :created }
#       else
#         format.html { render action: 'index' }
#         format.json { render json: @question.errors.full_messages, status: :unprocessable_entity }
#       end

    # if @new_answer.save
    #   redirect_to question_path(@question)
    # else
    #   @error = @new_answer.errors.full_messages.to_sentence
    #   render template: 'questions/show'
    # end

  end


  def upvote
    @answer = Answer.find(params[:id])
    @answer.ansvotes.create
    redirect_to question_path
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.ansvotes.last.destroy
    redirect_to question_path
  end

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
