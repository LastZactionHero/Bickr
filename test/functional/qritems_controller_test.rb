require 'test_helper'

class QritemsControllerTest < ActionController::TestCase
  setup do
    @qritem = qritems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qritems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qritem" do
    assert_difference('Qritem.count') do
      post :create, :qritem => @qritem.attributes
    end

    assert_redirected_to qritem_path(assigns(:qritem))
  end

  test "should show qritem" do
    get :show, :id => @qritem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @qritem.to_param
    assert_response :success
  end

  test "should update qritem" do
    put :update, :id => @qritem.to_param, :qritem => @qritem.attributes
    assert_redirected_to qritem_path(assigns(:qritem))
  end

  test "should destroy qritem" do
    assert_difference('Qritem.count', -1) do
      delete :destroy, :id => @qritem.to_param
    end

    assert_redirected_to qritems_path
  end
end
