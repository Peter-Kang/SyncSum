require 'test_helper'

class PositionDegreeConcentrationsControllerTest < ActionController::TestCase
  setup do
    @position_degree_concentration = position_degree_concentrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_degree_concentrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_degree_concentration" do
    assert_difference('PositionDegreeConcentration.count') do
      post :create, position_degree_concentration: @position_degree_concentration.attributes
    end

    assert_redirected_to position_degree_concentration_path(assigns(:position_degree_concentration))
  end

  test "should show position_degree_concentration" do
    get :show, id: @position_degree_concentration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_degree_concentration
    assert_response :success
  end

  test "should update position_degree_concentration" do
    put :update, id: @position_degree_concentration, position_degree_concentration: @position_degree_concentration.attributes
    assert_redirected_to position_degree_concentration_path(assigns(:position_degree_concentration))
  end

  test "should destroy position_degree_concentration" do
    assert_difference('PositionDegreeConcentration.count', -1) do
      delete :destroy, id: @position_degree_concentration
    end

    assert_redirected_to position_degree_concentrations_path
  end
end
