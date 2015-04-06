class QuestionsController < ApplicationController
  def index
    @in=Question.all
  end
end
