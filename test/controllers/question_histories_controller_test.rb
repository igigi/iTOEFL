require 'test_helper'

class QuestionHistoriesControllerTest < ActionController::TestCase
  setup do
    @question_history = question_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_history" do
    assert_difference('QuestionHistory.count') do
      post :create, question_history: { answer: @question_history.answer, is_correct: @question_history.is_correct, question_id: @question_history.question_id, user_id: @question_history.user_id }
    end

    assert_redirected_to question_history_path(assigns(:question_history))
  end

  test "should show question_history" do
    get :show, id: @question_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_history
    assert_response :success
  end

  test "should update question_history" do
    patch :update, id: @question_history, question_history: { answer: @question_history.answer, is_correct: @question_history.is_correct, question_id: @question_history.question_id, user_id: @question_history.user_id }
    assert_redirected_to question_history_path(assigns(:question_history))
  end

  test "should destroy question_history" do
    assert_difference('QuestionHistory.count', -1) do
      delete :destroy, id: @question_history
    end

    assert_redirected_to question_histories_path
  end
end
