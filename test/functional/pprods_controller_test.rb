require 'test_helper'

class PprodsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pprods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pprod" do
    assert_difference('Pprod.count') do
      post :create, :pprod => { }
    end

    assert_redirected_to pprod_path(assigns(:pprod))
  end

  test "should show pprod" do
    get :show, :id => pprods(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pprods(:one).id
    assert_response :success
  end

  test "should update pprod" do
    put :update, :id => pprods(:one).id, :pprod => { }
    assert_redirected_to pprod_path(assigns(:pprod))
  end

  test "should destroy pprod" do
    assert_difference('Pprod.count', -1) do
      delete :destroy, :id => pprods(:one).id
    end

    assert_redirected_to pprods_path
  end
end
