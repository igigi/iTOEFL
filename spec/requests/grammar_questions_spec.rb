require 'rails_helper'

RSpec.describe "GrammarQuestions", :type => :request do
  describe "GET /grammar_questions" do
    it "works! (now write some real specs)" do
      get grammar_questions_path
      expect(response).to have_http_status(200)
    end
  end
end
