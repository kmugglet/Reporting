require 'test_helper'

class UserReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create_spin user_report" do
    assert_difference('UserReport.count') do
      post :create, :user_report => { }
    end

    assert_redirected_to user_report_path(assigns(:user_report))
  end

  test "should edit user_report" do
    get :show, :id => user_reports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_reports(:one).to_param
    assert_response :success
  end

  test "should update user_report" do
    put :update, :id => user_reports(:one).to_param, :user_report => { }
    assert_redirected_to user_report_path(assigns(:user_report))
  end

  test "should destroy user_report" do
    assert_difference('UserReport.count', -1) do
      delete :destroy, :id => user_reports(:one).to_param
    end

    assert_redirected_to user_reports_path
  end
end
