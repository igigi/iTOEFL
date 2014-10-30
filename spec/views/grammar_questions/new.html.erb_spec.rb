require 'rails_helper'

RSpec.describe "grammar_questions/new", :type => :view do
  before(:each) do
    assign(:grammar_question, GrammarQuestion.new(
      :sequence_number => "MyString",
      :content => "MyText",
      :grammar_group => nil
    ))
  end

  it "renders new grammar_question form" do
    render

    assert_select "form[action=?][method=?]", grammar_questions_path, "post" do

      assert_select "input#grammar_question_sequence_number[name=?]", "grammar_question[sequence_number]"

      assert_select "textarea#grammar_question_content[name=?]", "grammar_question[content]"

      assert_select "input#grammar_question_grammar_group_id[name=?]", "grammar_question[grammar_group_id]"
    end
  end
end
