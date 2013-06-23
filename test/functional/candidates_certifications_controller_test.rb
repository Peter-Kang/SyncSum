require 'test_helper'

class CandidatesCertificationsControllerTest < ActionController::TestCase
  setup do
    @candidates_certification = candidates_certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates_certifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidates_certification" do
    assert_difference('CandidatesCertification.count') do
      post :create, candidates_certification: @candidates_certification.attributes
    end

    assert_redirected_to candidates_certification_path(assigns(:candidates_certification))
  end

  test "should show candidates_certification" do
    get :show, id: @candidates_certification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidates_certification
    assert_response :success
  end

  test "should update candidates_certification" do
    put :update, id: @candidates_certification, candidates_certification: @candidates_certification.attributes
    assert_redirected_to candidates_certification_path(assigns(:candidates_certification))
  end

  test "should destroy candidates_certification" do
    assert_difference('CandidatesCertification.count', -1) do
      delete :destroy, id: @candidates_certification
    end

    assert_redirected_to candidates_certifications_path
  end
end
