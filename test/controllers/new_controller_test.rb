require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get solution" do
    get :solution
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
