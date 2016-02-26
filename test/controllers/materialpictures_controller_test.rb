require 'test_helper'

class MaterialpicturesControllerTest < ActionController::TestCase
  setup do
    @materialpicture = materialpictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materialpictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materialpicture" do
    assert_difference('Materialpicture.count') do
      post :create, materialpicture: { file: @materialpicture.file, title: @materialpicture.title, user_id: @materialpicture.user_id }
    end

    assert_redirected_to materialpicture_path(assigns(:materialpicture))
  end

  test "should show materialpicture" do
    get :show, id: @materialpicture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materialpicture
    assert_response :success
  end

  test "should update materialpicture" do
    patch :update, id: @materialpicture, materialpicture: { file: @materialpicture.file, title: @materialpicture.title, user_id: @materialpicture.user_id }
    assert_redirected_to materialpicture_path(assigns(:materialpicture))
  end

  test "should destroy materialpicture" do
    assert_difference('Materialpicture.count', -1) do
      delete :destroy, id: @materialpicture
    end

    assert_redirected_to materialpictures_path
  end
end
