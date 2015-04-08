require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
end

let(:answer) do
  Answer.create!(title:"Yo", content:"yo mama, fool!", question_id:question.id)
end



 describe "GET index" do
  it 'should display question data' do
    question
    get :index
    expect(response.body).to include(question.title)
  end

  it 'should assign to questions' do
    question
    get :index
    expect(assigns(:questions)).to eq([question])
  end

  it "show list of all questions" do
    get :index
    expect(response).to render_template("index")
  end
 end


 describe "POST create" do
  it "should create a new question" do
    question
    expect(Question.exists?(title:"What is Ruby?")).to be(true)
  end
 end

 describe "GET show" do
  it "should display question content and answers" do
  question
  # answer
  get :show
    # expect(response.body).to include(question.answers.where(id: answer.id).title)
    # expect(response.body).to include(question.answers.where(id: answer.id).content)
    expect(response.body).to include(question.title)
    expect(response.body).to include(question.content)
  end
 end

end
