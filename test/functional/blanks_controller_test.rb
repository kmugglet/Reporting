require 'test_helper'

class BlanksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blanks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create_spin blank" do
    assert_difference('Blank.count') do
      post :create, :blank => { }
    end

    assert_redirected_to blank_path(assigns(:blank))
  end

  test "should edit blank" do
    get :show, :id => blanks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => blanks(:one).to_param
    assert_response :success
  end

  test "should update blank" do
    put :update, :id => blanks(:one).to_param, :blank => { }
    assert_redirected_to blank_path(assigns(:blank))
  end

  test "should destroy blank" do
    assert_difference('Blank.count', -1) do
      delete :destroy, :id => blanks(:one).to_param
    end

    assert_redirected_to blanks_path
  end
end
