require 'test_helper'

class AbstractObjectsControllerTest < ActionController::TestCase
  setup do
    @abstract_object = abstract_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abstract_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abstract_object" do
    assert_difference('AbstractObject.count') do
      post :create, abstract_object: {  }
    end

    assert_redirected_to abstract_object_path(assigns(:abstract_object))
  end

  test "should show abstract_object" do
    get :show, id: @abstract_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abstract_object
    assert_response :success
  end

  test "should update abstract_object" do
    patch :update, id: @abstract_object, abstract_object: {  }
    assert_redirected_to abstract_object_path(assigns(:abstract_object))
  end

  test "should destroy abstract_object" do
    assert_difference('AbstractObject.count', -1) do
      delete :destroy, id: @abstract_object
    end

    assert_redirected_to abstract_objects_path
  end
end
