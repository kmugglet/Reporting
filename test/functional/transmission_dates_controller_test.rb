require 'test_helper'

class TransmissionDatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transmission_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create_spin transmission_date" do
    assert_difference('TransmissionDate.count') do
      post :create, :transmission_date => { }
    end

    assert_redirected_to transmission_date_path(assigns(:transmission_date))
  end

  test "should edit transmission_date" do
    get :show, :id => transmission_dates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => transmission_dates(:one).to_param
    assert_response :success
  end

  test "should update transmission_date" do
    put :update, :id => transmission_dates(:one).to_param, :transmission_date => { }
    assert_redirected_to transmission_date_path(assigns(:transmission_date))
  end

  test "should destroy transmission_date" do
    assert_difference('TransmissionDate.count', -1) do
      delete :destroy, :id => transmission_dates(:one).to_param
    end

    assert_redirected_to transmission_dates_path
  end
end
