require 'test_helper'

class BroadcastSetsControllerTest < ActionController::TestCase
  setup do
    @broadcast_set = broadcast_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:broadcast_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create broadcast_set" do
    assert_difference('BroadcastSet.count') do
      post :create, broadcast_set: { cover: @broadcast_set.cover, description: @broadcast_set.description, title: @broadcast_set.title }
    end

    assert_redirected_to broadcast_set_path(assigns(:broadcast_set))
  end

  test "should show broadcast_set" do
    get :show, id: @broadcast_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @broadcast_set
    assert_response :success
  end

  test "should update broadcast_set" do
    patch :update, id: @broadcast_set, broadcast_set: { cover: @broadcast_set.cover, description: @broadcast_set.description, title: @broadcast_set.title }
    assert_redirected_to broadcast_set_path(assigns(:broadcast_set))
  end

  test "should destroy broadcast_set" do
    assert_difference('BroadcastSet.count', -1) do
      delete :destroy, id: @broadcast_set
    end

    assert_redirected_to broadcast_sets_path
  end
end
