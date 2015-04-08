class AnswersController < ApplicationController
  def create

    puts params

    @question = Question.find(params[:question_id])

    @new_answer = @question.answers.build(answer_params)

    if @new_answer.save
      redirect_to question_path(@question)
    else
      @error = @new_answer.errors.full_messages.to_sentence
      render template: 'questions/show'
    end

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
