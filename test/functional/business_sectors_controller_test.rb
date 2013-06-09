require 'test_helper'

class BusinessSectorsControllerTest < ActionController::TestCase
  setup do
    @business_sector = business_sectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_sectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_sector" do
    assert_difference('BusinessSector.count') do
      post :create, business_sector: @business_sector.attributes
    end

    assert_redirected_to business_sector_path(assigns(:business_sector))
  end

  test "should show business_sector" do
    get :show, id: @business_sector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_sector
    assert_response :success
  end

  test "should update business_sector" do
    put :update, id: @business_sector, business_sector: @business_sector.attributes
    assert_redirected_to business_sector_path(assigns(:business_sector))
  end

  test "should destroy business_sector" do
    assert_difference('BusinessSector.count', -1) do
      delete :destroy, id: @business_sector
    end

    assert_redirected_to business_sectors_path
  end
end
