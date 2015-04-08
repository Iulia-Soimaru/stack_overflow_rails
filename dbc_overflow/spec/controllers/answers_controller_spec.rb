require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
end

let(:answer) do
  Answer.create(title:"Yo...", content:"yo mama, fool!", question_id:question.id)
end

  describe 'Should be able to create answer in question' do
    it 'should assign answer to question' do
      question
      answer
      expect(question.answers.first.title).to eq(answer.title)
    end
  end

end
