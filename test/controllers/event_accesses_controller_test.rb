require 'test_helper'

class EventAccessesControllerTest < ActionController::TestCase
  setup do
    @event_access = event_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_access" do
    assert_difference('EventAccess.count') do
      post :create, event_access: { event_id: @event_access.event_id, type: @event_access.type, user_id: @event_access.user_id }
    end

    assert_redirected_to event_access_path(assigns(:event_access))
  end

  test "should show event_access" do
    get :show, id: @event_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_access
    assert_response :success
  end

  test "should update event_access" do
    patch :update, id: @event_access, event_access: { event_id: @event_access.event_id, type: @event_access.type, user_id: @event_access.user_id }
    assert_redirected_to event_access_path(assigns(:event_access))
  end

  test "should destroy event_access" do
    assert_difference('EventAccess.count', -1) do
      delete :destroy, id: @event_access
    end

    assert_redirected_to event_accesses_path
  end
end
