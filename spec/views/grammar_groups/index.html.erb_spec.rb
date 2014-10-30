require 'rails_helper'

RSpec.describe "grammar_groups/index", :type => :view do
  before(:each) do
    assign(:grammar_groups, [
      GrammarGroup.create!(
        :sequence_number => "Sequence Number",
        :group_type => "Group Type"
      ),
      GrammarGroup.create!(
        :sequence_number => "Sequence Number",
        :group_type => "Group Type"
      )
    ])
  end

  it "renders a list of grammar_groups" do
    render
    assert_select "tr>td", :text => "Sequence Number".to_s, :count => 2
    assert_select "tr>td", :text => "Group Type".to_s, :count => 2
  end
end
