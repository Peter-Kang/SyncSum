require 'test_helper'

class QuestionImportancesControllerTest < ActionController::TestCase
  setup do
    @question_importance = question_importances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_importances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_importance" do
    assert_difference('QuestionImportance.count') do
      post :create, question_importance: @question_importance.attributes
    end

    assert_redirected_to question_importance_path(assigns(:question_importance))
  end

  test "should show question_importance" do
    get :show, id: @question_importance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_importance
    assert_response :success
  end

  test "should update question_importance" do
    put :update, id: @question_importance, question_importance: @question_importance.attributes
    assert_redirected_to question_importance_path(assigns(:question_importance))
  end

  test "should destroy question_importance" do
    assert_difference('QuestionImportance.count', -1) do
      delete :destroy, id: @question_importance
    end

    assert_redirected_to question_importances_path
  end
end
