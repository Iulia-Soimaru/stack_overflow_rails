require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

let(:question) do
  Question.create!(title:"What is Ruby?", content:"nothing")
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

end
