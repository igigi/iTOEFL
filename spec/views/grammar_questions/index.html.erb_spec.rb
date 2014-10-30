require 'rails_helper'

RSpec.describe "grammar_questions/index", :type => :view do
  before(:each) do
    assign(:grammar_questions, [
      GrammarQuestion.create!(
        :sequence_number => "Sequence Number",
        :content => "MyText",
        :grammar_group => nil
      ),
      GrammarQuestion.create!(
        :sequence_number => "Sequence Number",
        :content => "MyText",
        :grammar_group => nil
      )
    ])
  end

  it "renders a list of grammar_questions" do
    render
    assert_select "tr>td", :text => "Sequence Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
