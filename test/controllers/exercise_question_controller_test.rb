require 'test_helper'

class ExerciseQuestionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

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

  test "should get newmc" do
    get :newmc
    assert_response :success
  end

  test "should get newfreetext" do
    get :newfreetext
    assert_response :success
  end

end
