require 'test_helper'

class MiddleSchoolsControllerTest < ActionController::TestCase
  setup do
    @middle_school = middle_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:middle_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create middle_school" do
    assert_difference('MiddleSchool.count') do
      post :create, middle_school: { address: @middle_school.address, feature: @middle_school.feature, level: @middle_school.level, name: @middle_school.name, phone: @middle_school.phone }
    end

    assert_redirected_to middle_school_path(assigns(:middle_school))
  end

  test "should show middle_school" do
    get :show, id: @middle_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @middle_school
    assert_response :success
  end

  test "should update middle_school" do
    put :update, id: @middle_school, middle_school: { address: @middle_school.address, feature: @middle_school.feature, level: @middle_school.level, name: @middle_school.name, phone: @middle_school.phone }
    assert_redirected_to middle_school_path(assigns(:middle_school))
  end

  test "should destroy middle_school" do
    assert_difference('MiddleSchool.count', -1) do
      delete :destroy, id: @middle_school
    end

    assert_redirected_to middle_schools_path
  end
end
