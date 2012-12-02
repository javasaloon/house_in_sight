require 'test_helper'

class PrimarySchoolsControllerTest < ActionController::TestCase
  setup do
    @primary_school = primary_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primary_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primary_school" do
    assert_difference('PrimarySchool.count') do
      post :create, primary_school: { address: @primary_school.address, feature: @primary_school.feature, level: @primary_school.level, name: @primary_school.name, phone: @primary_school.phone }
    end

    assert_redirected_to primary_school_path(assigns(:primary_school))
  end

  test "should show primary_school" do
    get :show, id: @primary_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primary_school
    assert_response :success
  end

  test "should update primary_school" do
    put :update, id: @primary_school, primary_school: { address: @primary_school.address, feature: @primary_school.feature, level: @primary_school.level, name: @primary_school.name, phone: @primary_school.phone }
    assert_redirected_to primary_school_path(assigns(:primary_school))
  end

  test "should destroy primary_school" do
    assert_difference('PrimarySchool.count', -1) do
      delete :destroy, id: @primary_school
    end

    assert_redirected_to primary_schools_path
  end
end
