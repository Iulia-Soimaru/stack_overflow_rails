require 'rails_helper'

RSpec.describe Answer, type: :model do
let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
end

context "It describes the question model" do
  it 'should be valid question' do
   Answer.create(title:nil, content:nil).should_not be_valid
  end

  it 'should be valid Answer(title)' do
   Answer.create(title:nil, content:"something something").should_not be_valid
  end

  it 'should be valid Answer(content)' do
   Answer.create(title:"something", content:nil).should_not be_valid
  end

  it 'creates a valid Answer' do
    question
    Answer.create(title:"something", content:"something something", question_id:question.id).should be_valid
  end
end

end
