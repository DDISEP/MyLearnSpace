require 'test_helper'

class MaterialdocumentsControllerTest < ActionController::TestCase
  setup do
    @materialdocument = materialdocuments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materialdocuments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materialdocument" do
    assert_difference('Materialdocument.count') do
      post :create, materialdocument: { title: @materialdocument.title, user_id: @materialdocument.user_id }
    end

    assert_redirected_to materialdocument_path(assigns(:materialdocument))
  end

  test "should show materialdocument" do
    get :show, id: @materialdocument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materialdocument
    assert_response :success
  end

  test "should update materialdocument" do
    patch :update, id: @materialdocument, materialdocument: { title: @materialdocument.title, user_id: @materialdocument.user_id }
    assert_redirected_to materialdocument_path(assigns(:materialdocument))
  end

  test "should destroy materialdocument" do
    assert_difference('Materialdocument.count', -1) do
      delete :destroy, id: @materialdocument
    end

    assert_redirected_to materialdocuments_path
  end
end
