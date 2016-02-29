require 'test_helper'

class MaterialtextsControllerTest < ActionController::TestCase
  setup do
    @materialtext = materialtexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materialtexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materialtext" do
    assert_difference('Materialtext.count') do
      post :create, materialtext: { text: @materialtext.text, title: @materialtext.title, user_id: @materialtext.user_id }
    end

    assert_redirected_to materialtext_path(assigns(:materialtext))
  end

  test "should show materialtext" do
    get :show, id: @materialtext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materialtext
    assert_response :success
  end

  test "should update materialtext" do
    patch :update, id: @materialtext, materialtext: { text: @materialtext.text, title: @materialtext.title, user_id: @materialtext.user_id }
    assert_redirected_to materialtext_path(assigns(:materialtext))
  end

  test "should destroy materialtext" do
    assert_difference('Materialtext.count', -1) do
      delete :destroy, id: @materialtext
    end

    assert_redirected_to materialtexts_path
  end
end
