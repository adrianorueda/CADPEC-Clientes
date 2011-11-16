require 'test_helper'

class VendedoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedores" do
    assert_difference('Vendedores.count') do
      post :create, :vendedores => { }
    end

    assert_redirected_to vendedores_path(assigns(:vendedores))
  end

  test "should show vendedores" do
    get :show, :id => vendedores(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vendedores(:one).id
    assert_response :success
  end

  test "should update vendedores" do
    put :update, :id => vendedores(:one).id, :vendedores => { }
    assert_redirected_to vendedores_path(assigns(:vendedores))
  end

  test "should destroy vendedores" do
    assert_difference('Vendedores.count', -1) do
      delete :destroy, :id => vendedores(:one).id
    end

    assert_redirected_to vendedores_path
  end
end
