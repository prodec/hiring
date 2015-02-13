require 'test_helper'

class RoadwaysControllerTest < ActionController::TestCase
  setup do
    @roadway = roadways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roadways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create roadway" do
  #   assert_difference('Roadway.count') do
  #     post :create, roadway: { conservacao: @roadway.conservacao, rodovia: @roadway.rodovia, sentido: @roadway.sentido, tipo: @roadway.tipo }
  #   end
  #
  #   assert_redirected_to roadway_path(assigns(:roadway))
  # end

  test "should show roadway" do
    get :show, id: @roadway
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roadway
    assert_response :success
  end

  test "should update roadway" do
    patch :update, id: @roadway, roadway: { conservacao: @roadway.conservacao, rodovia: @roadway.rodovia, sentido: @roadway.sentido, tipo: @roadway.tipo }
    assert_redirected_to roadway_path(assigns(:roadway))
  end

  test "should destroy roadway" do
    assert_difference('Roadway.count', -1) do
      delete :destroy, id: @roadway
    end

    assert_redirected_to roadways_path
  end
end
