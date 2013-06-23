require 'test_helper'

class CandidatesConcentrationsDegreesControllerTest < ActionController::TestCase
  setup do
    @candidates_concentrations_degree = candidates_concentrations_degrees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates_concentrations_degrees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidates_concentrations_degree" do
    assert_difference('CandidatesConcentrationsDegree.count') do
      post :create, candidates_concentrations_degree: @candidates_concentrations_degree.attributes
    end

    assert_redirected_to candidates_concentrations_degree_path(assigns(:candidates_concentrations_degree))
  end

  test "should show candidates_concentrations_degree" do
    get :show, id: @candidates_concentrations_degree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidates_concentrations_degree
    assert_response :success
  end

  test "should update candidates_concentrations_degree" do
    put :update, id: @candidates_concentrations_degree, candidates_concentrations_degree: @candidates_concentrations_degree.attributes
    assert_redirected_to candidates_concentrations_degree_path(assigns(:candidates_concentrations_degree))
  end

  test "should destroy candidates_concentrations_degree" do
    assert_difference('CandidatesConcentrationsDegree.count', -1) do
      delete :destroy, id: @candidates_concentrations_degree
    end

    assert_redirected_to candidates_concentrations_degrees_path
  end
end
