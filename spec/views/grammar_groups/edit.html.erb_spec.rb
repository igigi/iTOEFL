require 'rails_helper'

RSpec.describe "grammar_groups/edit", :type => :view do
  before(:each) do
    @grammar_group = assign(:grammar_group, GrammarGroup.create!(
      :sequence_number => "MyString",
      :group_type => "MyString"
    ))
  end

  it "renders the edit grammar_group form" do
    render

    assert_select "form[action=?][method=?]", grammar_group_path(@grammar_group), "post" do

      assert_select "input#grammar_group_sequence_number[name=?]", "grammar_group[sequence_number]"

      assert_select "input#grammar_group_group_type[name=?]", "grammar_group[group_type]"
    end
  end
end
