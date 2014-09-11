require 'test_helper'

class RbCommentsControllerTest < ActionController::TestCase
  setup do
    @rb_comment = rb_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rb_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rb_comment" do
    assert_difference('RbComment.count') do
      post :create, rb_comment: { content: @rb_comment.content, recorded_broadcast_id: @rb_comment.recorded_broadcast_id, user_id: @rb_comment.user_id }
    end

    assert_redirected_to rb_comment_path(assigns(:rb_comment))
  end

  test "should show rb_comment" do
    get :show, id: @rb_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rb_comment
    assert_response :success
  end

  test "should update rb_comment" do
    patch :update, id: @rb_comment, rb_comment: { content: @rb_comment.content, recorded_broadcast_id: @rb_comment.recorded_broadcast_id, user_id: @rb_comment.user_id }
    assert_redirected_to rb_comment_path(assigns(:rb_comment))
  end

  test "should destroy rb_comment" do
    assert_difference('RbComment.count', -1) do
      delete :destroy, id: @rb_comment
    end

    assert_redirected_to rb_comments_path
  end
end
