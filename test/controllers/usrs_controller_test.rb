require 'test_helper'

class UsrsControllerTest < ActionController::TestCase
  setup do
    @usr = usrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usr" do
    assert_difference('Usr.count') do
      post :create, usr: { email: @usr.email, name: @usr.name }
    end

    assert_redirected_to usr_path(assigns(:usr))
  end

  test "should show usr" do
    get :show, id: @usr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usr
    assert_response :success
  end

  test "should update usr" do
    patch :update, id: @usr, usr: { email: @usr.email, name: @usr.name }
    assert_redirected_to usr_path(assigns(:usr))
  end

  test "should destroy usr" do
    assert_difference('Usr.count', -1) do
      delete :destroy, id: @usr
    end

    assert_redirected_to usrs_path
  end
end
