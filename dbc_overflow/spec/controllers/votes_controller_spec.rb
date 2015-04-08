require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  describe "POST /questions/:question_id/votes" do
    it "should redirect to the homepage" do
      post "/questions/#{@question.id}/votes"
      expect(response).to have_http_status(302)
    end
  end
end
