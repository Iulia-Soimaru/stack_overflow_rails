require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
end

let(:answer) do
  Answer.create(title:"Yo...", content:"yo mama, fool!", question_id:question.id)
  # question.answers.build()
end


 describe "GET index" do
    it 'should display Answer data' do
      question
      answer
      get :show, id:question.id
      expect(response.body).to include(answer.title)
      expect(response.body).to include(answer.content)
    end
  end

  describe 'create answer in question' do
    it 'should assign answer to question' do
      question
      answer
      get :show, id:question.id
      expect(question.answers.first).to eq(answer)
    end
  end

#   it "show list of all answers" do
#     get :index
#     expect(response).to render_template("index")
#   end
#  end


end
