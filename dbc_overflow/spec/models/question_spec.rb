require 'rails_helper'

RSpec.describe Question, type: :model do
context "It describes the question model" do
  it 'should be valid question' do
   Question.create(title:nil, content:nil).should_not be_valid
  end

  it 'should be valid question(title)' do
   Question.create(title:nil, content:"something something").should_not be_valid
  end

  it 'should be valid question(content)' do
   Question.create(title:"something", content:nil).should_not be_valid
  end

  it 'creates a valid question' do
    Question.create(title:"something", content:"something something").should be_valid
  end
end

end
