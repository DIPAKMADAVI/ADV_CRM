require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get create_user" do
    get user_create_user_url
    assert_response :success
  end

  test "should get remove_user" do
    get user_remove_user_url
    assert_response :success
  end

  test "should get update_user" do
    get user_update_user_url
    assert_response :success
  end
end
