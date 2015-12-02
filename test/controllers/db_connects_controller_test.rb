require 'test_helper'

class DbConnectsControllerTest < ActionController::TestCase
  setup do
    @db_connect = db_connects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_connects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_connect" do
    assert_difference('DbConnect.count') do
      post :create, db_connect: { data_base: @db_connect.data_base, password: @db_connect.password, username: @db_connect.username }
    end

    assert_redirected_to db_connect_path(assigns(:db_connect))
  end

  test "should show db_connect" do
    get :show, id: @db_connect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @db_connect
    assert_response :success
  end

  test "should update db_connect" do
    patch :update, id: @db_connect, db_connect: { data_base: @db_connect.data_base, password: @db_connect.password, username: @db_connect.username }
    assert_redirected_to db_connect_path(assigns(:db_connect))
  end

  test "should destroy db_connect" do
    assert_difference('DbConnect.count', -1) do
      delete :destroy, id: @db_connect
    end

    assert_redirected_to db_connects_path
  end
end
