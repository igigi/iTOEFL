require 'test_helper'

class AddQuestionsControllerTest < ActionController::TestCase
  setup do
    @add_question = add_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_question" do
    assert_difference('AddQuestion.count') do
      post :create, add_question: { content: @add_question.content, mark_id: @add_question.mark_id, user_id: @add_question.user_id }
    end

    assert_redirected_to add_question_path(assigns(:add_question))
  end

  test "should show add_question" do
    get :show, id: @add_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_question
    assert_response :success
  end

  test "should update add_question" do
    patch :update, id: @add_question, add_question: { content: @add_question.content, mark_id: @add_question.mark_id, user_id: @add_question.user_id }
    assert_redirected_to add_question_path(assigns(:add_question))
  end

  test "should destroy add_question" do
    assert_difference('AddQuestion.count', -1) do
      delete :destroy, id: @add_question
    end

    assert_redirected_to add_questions_path
  end
end
