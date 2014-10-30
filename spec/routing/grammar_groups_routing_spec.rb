require "rails_helper"

RSpec.describe GrammarGroupsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grammar_groups").to route_to("grammar_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/grammar_groups/new").to route_to("grammar_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/grammar_groups/1").to route_to("grammar_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grammar_groups/1/edit").to route_to("grammar_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grammar_groups").to route_to("grammar_groups#create")
    end

    it "routes to #update" do
      expect(:put => "/grammar_groups/1").to route_to("grammar_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grammar_groups/1").to route_to("grammar_groups#destroy", :id => "1")
    end

  end
end
