require 'test_helper'

class CandidateCertificationsControllerTest < ActionController::TestCase
  setup do
    @candidate_certification = candidate_certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_certifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_certification" do
    assert_difference('CandidateCertification.count') do
      post :create, candidate_certification: @candidate_certification.attributes
    end

    assert_redirected_to candidate_certification_path(assigns(:candidate_certification))
  end

  test "should show candidate_certification" do
    get :show, id: @candidate_certification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_certification
    assert_response :success
  end

  test "should update candidate_certification" do
    put :update, id: @candidate_certification, candidate_certification: @candidate_certification.attributes
    assert_redirected_to candidate_certification_path(assigns(:candidate_certification))
  end

  test "should destroy candidate_certification" do
    assert_difference('CandidateCertification.count', -1) do
      delete :destroy, id: @candidate_certification
    end

    assert_redirected_to candidate_certifications_path
  end
end
