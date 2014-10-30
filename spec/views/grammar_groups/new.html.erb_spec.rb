require 'rails_helper'

RSpec.describe "grammar_groups/new", :type => :view do
  before(:each) do
    assign(:grammar_group, GrammarGroup.new(
      :sequence_number => "MyString",
      :group_type => "MyString"
    ))
  end

  it "renders new grammar_group form" do
    render

    assert_select "form[action=?][method=?]", grammar_groups_path, "post" do

      assert_select "input#grammar_group_sequence_number[name=?]", "grammar_group[sequence_number]"

      assert_select "input#grammar_group_group_type[name=?]", "grammar_group[group_type]"
    end
  end
end
