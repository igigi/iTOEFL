require 'rails_helper'

RSpec.describe "GrammarGroups", :type => :request do
  describe "GET /grammar_groups" do
    it "works! (now write some real specs)" do
      get grammar_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
