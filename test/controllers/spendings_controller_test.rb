require 'test_helper'

class SpendingsControllerTest < ActionController::TestCase
  setup do
    @spending = spendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spending" do
    assert_difference('Spending.count') do
      post :create, spending: { amount: @spending.amount, person_id: @spending.person_id }
    end

    assert_redirected_to spending_path(assigns(:spending))
  end

  test "should show spending" do
    get :show, id: @spending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spending
    assert_response :success
  end

  test "should update spending" do
    patch :update, id: @spending, spending: { amount: @spending.amount, person_id: @spending.person_id }
    assert_redirected_to spending_path(assigns(:spending))
  end

  test "should destroy spending" do
    assert_difference('Spending.count', -1) do
      delete :destroy, id: @spending
    end

    assert_redirected_to spendings_path
  end
end
