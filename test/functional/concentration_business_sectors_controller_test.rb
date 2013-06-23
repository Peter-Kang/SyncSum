require 'test_helper'

class ConcentrationBusinessSectorsControllerTest < ActionController::TestCase
  setup do
    @concentration_business_sector = concentration_business_sectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concentration_business_sectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concentration_business_sector" do
    assert_difference('ConcentrationBusinessSector.count') do
      post :create, concentration_business_sector: @concentration_business_sector.attributes
    end

    assert_redirected_to concentration_business_sector_path(assigns(:concentration_business_sector))
  end

  test "should show concentration_business_sector" do
    get :show, id: @concentration_business_sector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concentration_business_sector
    assert_response :success
  end

  test "should update concentration_business_sector" do
    put :update, id: @concentration_business_sector, concentration_business_sector: @concentration_business_sector.attributes
    assert_redirected_to concentration_business_sector_path(assigns(:concentration_business_sector))
  end

  test "should destroy concentration_business_sector" do
    assert_difference('ConcentrationBusinessSector.count', -1) do
      delete :destroy, id: @concentration_business_sector
    end

    assert_redirected_to concentration_business_sectors_path
  end
end
