require 'test_helper'

class ContentsControllerTest < ActionController::TestCase
  setup do
    @knowledge_elements = contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content" do
    assert_difference('Content.count') do
      post :create, knowledge_elements: { tag: @knowledge_elements.tag }
    end

    assert_redirected_to content_path(assigns(:knowledge_elements))
  end

  test "should show content" do
    get :show, id: @knowledge_elements
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledge_elements
    assert_response :success
  end

  test "should update content" do
    patch :update, id: @knowledge_elements, knowledge_elements: { tag: @knowledge_elements.tag }
    assert_redirected_to content_path(assigns(:knowledge_elements))
  end

  test "should destroy content" do
    assert_difference('Content.count', -1) do
      delete :destroy, id: @knowledge_elements
    end

    assert_redirected_to contents_path
  end
end
