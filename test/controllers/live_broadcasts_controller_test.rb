require 'test_helper'

class LiveBroadcastsControllerTest < ActionController::TestCase
  setup do
    @live_broadcast = live_broadcasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:live_broadcasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create live_broadcast" do
    assert_difference('LiveBroadcast.count') do
      post :create, live_broadcast: { cover: @live_broadcast.cover, start_at: @live_broadcast.start_at, summary: @live_broadcast.summary, title: @live_broadcast.title, video_url: @live_broadcast.video_url }
    end

    assert_redirected_to live_broadcast_path(assigns(:live_broadcast))
  end

  test "should show live_broadcast" do
    get :show, id: @live_broadcast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @live_broadcast
    assert_response :success
  end

  test "should update live_broadcast" do
    patch :update, id: @live_broadcast, live_broadcast: { cover: @live_broadcast.cover, start_at: @live_broadcast.start_at, summary: @live_broadcast.summary, title: @live_broadcast.title, video_url: @live_broadcast.video_url }
    assert_redirected_to live_broadcast_path(assigns(:live_broadcast))
  end

  test "should destroy live_broadcast" do
    assert_difference('LiveBroadcast.count', -1) do
      delete :destroy, id: @live_broadcast
    end

    assert_redirected_to live_broadcasts_path
  end
end
