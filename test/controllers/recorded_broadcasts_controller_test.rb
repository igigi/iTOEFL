require 'test_helper'

class RecordedBroadcastsControllerTest < ActionController::TestCase
  setup do
    @recorded_broadcast = recorded_broadcasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recorded_broadcasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recorded_broadcast" do
    assert_difference('RecordedBroadcast.count') do
      post :create, recorded_broadcast: { broadcast_set_id: @recorded_broadcast.broadcast_set_id, cover: @recorded_broadcast.cover, summary: @recorded_broadcast.summary, title: @recorded_broadcast.title, video_url: @recorded_broadcast.video_url }
    end

    assert_redirected_to recorded_broadcast_path(assigns(:recorded_broadcast))
  end

  test "should show recorded_broadcast" do
    get :show, id: @recorded_broadcast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recorded_broadcast
    assert_response :success
  end

  test "should update recorded_broadcast" do
    patch :update, id: @recorded_broadcast, recorded_broadcast: { broadcast_set_id: @recorded_broadcast.broadcast_set_id, cover: @recorded_broadcast.cover, summary: @recorded_broadcast.summary, title: @recorded_broadcast.title, video_url: @recorded_broadcast.video_url }
    assert_redirected_to recorded_broadcast_path(assigns(:recorded_broadcast))
  end

  test "should destroy recorded_broadcast" do
    assert_difference('RecordedBroadcast.count', -1) do
      delete :destroy, id: @recorded_broadcast
    end

    assert_redirected_to recorded_broadcasts_path
  end
end
