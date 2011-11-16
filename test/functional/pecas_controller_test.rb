require 'test_helper'

class PecasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pecas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peca" do
    assert_difference('Peca.count') do
      post :create, :peca => { }
    end

    assert_redirected_to peca_path(assigns(:peca))
  end

  test "should show peca" do
    get :show, :id => pecas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pecas(:one).id
    assert_response :success
  end

  test "should update peca" do
    put :update, :id => pecas(:one).id, :peca => { }
    assert_redirected_to peca_path(assigns(:peca))
  end

  test "should destroy peca" do
    assert_difference('Peca.count', -1) do
      delete :destroy, :id => pecas(:one).id
    end

    assert_redirected_to pecas_path
  end
end
