require 'test_helper'

class MaterialvideosControllerTest < ActionController::TestCase
  setup do
    @materialvideo = materialvideos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materialvideos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materialvideo" do
    assert_difference('Materialvideo.count') do
      post :create, materialvideo: { file: @materialvideo.file, fileformat: @materialvideo.fileformat, filename: @materialvideo.filename, title: @materialvideo.title, user_id: @materialvideo.user_id }
    end

    assert_redirected_to materialvideo_path(assigns(:materialvideo))
  end

  test "should show materialvideo" do
    get :show, id: @materialvideo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materialvideo
    assert_response :success
  end

  test "should update materialvideo" do
    patch :update, id: @materialvideo, materialvideo: { file: @materialvideo.file, fileformat: @materialvideo.fileformat, filename: @materialvideo.filename, title: @materialvideo.title, user_id: @materialvideo.user_id }
    assert_redirected_to materialvideo_path(assigns(:materialvideo))
  end

  test "should destroy materialvideo" do
    assert_difference('Materialvideo.count', -1) do
      delete :destroy, id: @materialvideo
    end

    assert_redirected_to materialvideos_path
  end
end
