require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @learning_units = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_units" do
    assert_difference('LearningUnit.count') do
      post :create, learning_units: { descriptionOfContent: @learning_units.descriptionOfContent, hours: @learning_units.hours, title: @learning_units.title }
    end

    assert_redirected_to item_path(assigns(:learning_units))
  end

  test "should show learning_units" do
    get :show, id: @learning_units
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learning_units
    assert_response :success
  end

  test "should update learning_units" do
    patch :update, id: @learning_units, learning_units: { descriptionOfContent: @learning_units.descriptionOfContent, hours: @learning_units.hours, title: @learning_units.title }
    assert_redirected_to item_path(assigns(:learning_units))
  end

  test "should destroy learning_units" do
    assert_difference('LearningUnit.count', -1) do
      delete :destroy, id: @learning_units
    end

    assert_redirected_to items_path
  end
end
