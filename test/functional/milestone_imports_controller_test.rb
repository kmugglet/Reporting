require 'test_helper'

class MilestoneImportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestone_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create_spin milestone_import" do
    assert_difference('MilestoneImport.count') do
      post :create, :milestone_import => { }
    end

    assert_redirected_to milestone_import_path(assigns(:milestone_import))
  end

  test "should edit milestone_import" do
    get :show, :id => milestone_imports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => milestone_imports(:one).to_param
    assert_response :success
  end

  test "should update milestone_import" do
    put :update, :id => milestone_imports(:one).to_param, :milestone_import => { }
    assert_redirected_to milestone_import_path(assigns(:milestone_import))
  end

  test "should destroy milestone_import" do
    assert_difference('MilestoneImport.count', -1) do
      delete :destroy, :id => milestone_imports(:one).to_param
    end

    assert_redirected_to milestone_imports_path
  end
end
