require 'test_helper'

class EmployeeApplicationsControllerTest < ActionController::TestCase
  setup do
    @employee_application = employee_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_application" do
    assert_difference('EmployeeApplication.count') do
      post :create, employee_application: { employee_id: @employee_application.employee_id, employer_Id: @employee_application.employer_Id }
    end

    assert_redirected_to employee_application_path(assigns(:employee_application))
  end

  test "should show employee_application" do
    get :show, id: @employee_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_application
    assert_response :success
  end

  test "should update employee_application" do
    put :update, id: @employee_application, employee_application: { employee_id: @employee_application.employee_id, employer_Id: @employee_application.employer_Id }
    assert_redirected_to employee_application_path(assigns(:employee_application))
  end

  test "should destroy employee_application" do
    assert_difference('EmployeeApplication.count', -1) do
      delete :destroy, id: @employee_application
    end

    assert_redirected_to employee_applications_path
  end
end
