require 'test_helper'

class MateriallinksControllerTest < ActionController::TestCase
  setup do
    @materiallink = materiallinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materiallinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materiallink" do
    assert_difference('Materiallink.count') do
      post :create, materiallink: { link: @materiallink.link, title: @materiallink.title, user_id: @materiallink.user_id }
    end

    assert_redirected_to materiallink_path(assigns(:materiallink))
  end

  test "should show materiallink" do
    get :show, id: @materiallink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materiallink
    assert_response :success
  end

  test "should update materiallink" do
    patch :update, id: @materiallink, materiallink: { link: @materiallink.link, title: @materiallink.title, user_id: @materiallink.user_id }
    assert_redirected_to materiallink_path(assigns(:materiallink))
  end

  test "should destroy materiallink" do
    assert_difference('Materiallink.count', -1) do
      delete :destroy, id: @materiallink
    end

    assert_redirected_to materiallinks_path
  end
end
