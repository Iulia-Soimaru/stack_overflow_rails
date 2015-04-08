class QuestionsController < ApplicationController
  def index
    @questions=Question.all
    headers = {
      "User-Agent" => "DBC-Overflow"
    }
    # @questions.each do |question|
    #   question.votes = Vote.where(question_id: question.id)
    # end

    # binding.pry
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
    # @answer_one = Answer.find(params[:id])
    @new_answer = Answer.new
    @answer = Answer.where(question_id: @question.id).first
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path
  end

  # def upvote
  #   @question = Question.find(params[:id])
  #   @question.votes.create
  #   redirect_to questions_path
  # end

  # def downvote
  #   @question = Question.find(params[:id])
  #   @question.votes.last.destroy
  #   redirect_to questions_path
  # end

  def destroy
    p "in destroy route"
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
