require 'rails_helper'

RSpec.describe "grammar_questions/show", :type => :view do
  before(:each) do
    @grammar_question = assign(:grammar_question, GrammarQuestion.create!(
      :sequence_number => "Sequence Number",
      :content => "MyText",
      :grammar_group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sequence Number/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
