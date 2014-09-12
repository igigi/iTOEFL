require 'test_helper'

class LbCommentsControllerTest < ActionController::TestCase
  setup do
    @lb_comment = lb_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lb_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lb_comment" do
    assert_difference('LbComment.count') do
      post :create, lb_comment: { content: @lb_comment.content, live_broadcast_id: @lb_comment.live_broadcast_id, user_id: @lb_comment.user_id }
    end

    assert_redirected_to lb_comment_path(assigns(:lb_comment))
  end

  test "should show lb_comment" do
    get :show, id: @lb_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lb_comment
    assert_response :success
  end

  test "should update lb_comment" do
    patch :update, id: @lb_comment, lb_comment: { content: @lb_comment.content, live_broadcast_id: @lb_comment.live_broadcast_id, user_id: @lb_comment.user_id }
    assert_redirected_to lb_comment_path(assigns(:lb_comment))
  end

  test "should destroy lb_comment" do
    assert_difference('LbComment.count', -1) do
      delete :destroy, id: @lb_comment
    end

    assert_redirected_to lb_comments_path
  end
end
