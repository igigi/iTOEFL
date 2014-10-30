require 'rails_helper'

RSpec.describe "grammar_groups/show", :type => :view do
  before(:each) do
    @grammar_group = assign(:grammar_group, GrammarGroup.create!(
      :sequence_number => "Sequence Number",
      :group_type => "Group Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sequence Number/)
    expect(rendered).to match(/Group Type/)
  end
end
