require 'test_helper'

class CandidateDegreeConcentrationsControllerTest < ActionController::TestCase
  setup do
    @candidate_degree_concentration = candidate_degree_concentrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_degree_concentrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_degree_concentration" do
    assert_difference('CandidateDegreeConcentration.count') do
      post :create, candidate_degree_concentration: @candidate_degree_concentration.attributes
    end

    assert_redirected_to candidate_degree_concentration_path(assigns(:candidate_degree_concentration))
  end

  test "should show candidate_degree_concentration" do
    get :show, id: @candidate_degree_concentration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_degree_concentration
    assert_response :success
  end

  test "should update candidate_degree_concentration" do
    put :update, id: @candidate_degree_concentration, candidate_degree_concentration: @candidate_degree_concentration.attributes
    assert_redirected_to candidate_degree_concentration_path(assigns(:candidate_degree_concentration))
  end

  test "should destroy candidate_degree_concentration" do
    assert_difference('CandidateDegreeConcentration.count', -1) do
      delete :destroy, id: @candidate_degree_concentration
    end

    assert_redirected_to candidate_degree_concentrations_path
  end
end
