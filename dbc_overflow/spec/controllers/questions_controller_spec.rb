require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
end

let(:answer) do
  Answer.create!(title:"Yo", content:"yo mama, fool!", question_id:question.id)
end

let(:vote) do
  Vote.create!(question_id:question.id)
end

let(:ansvote) do
  Ansvote.create!(answer_id:answer.id)
end


 describe "GET index" do
  it 'should display question data' do
    question
    answer
    vote
    get :index
    expect(response.body).to include(question.title)
  end

  it 'should assign to questions' do
    question
    answer
    vote
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
    params = {title:"Ruby?", content:"wtf ruby!"}
    post :create, params
  end
 end

 describe "POST edit" do
  it "should find an existing question to edit" do
    question
    params = {id: question.id}
    post :edit, params
  end

  it "tests the update method" do
    question
    params = {id: question.id}
    # question_params = {title:"Rubyedited?", content:"wtf ruby!edited", id:question.id}
    put :update, params #, question_params
  end
 end

 describe "GET show" do
  it "should display question content and answers" do
  question
  answer
  vote
  ansvote
  get :show, id: question.id
    expect(response.body).to include(question.title)
    expect(response.body).to include(question.content)
    expect(response.body).to include(question.answers.where(question_id: question.id).first.title)
    expect(response.body).to include(question.answers.where(question_id: question.id).first.content)
  end
 end

end
