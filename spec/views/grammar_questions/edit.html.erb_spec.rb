require 'rails_helper'

RSpec.describe "grammar_questions/edit", :type => :view do
  before(:each) do
    @grammar_question = assign(:grammar_question, GrammarQuestion.create!(
      :sequence_number => "MyString",
      :content => "MyText",
      :grammar_group => nil
    ))
  end

  it "renders the edit grammar_question form" do
    render

    assert_select "form[action=?][method=?]", grammar_question_path(@grammar_question), "post" do

      assert_select "input#grammar_question_sequence_number[name=?]", "grammar_question[sequence_number]"

      assert_select "textarea#grammar_question_content[name=?]", "grammar_question[content]"

      assert_select "input#grammar_question_grammar_group_id[name=?]", "grammar_question[grammar_group_id]"
    end
  end
end
