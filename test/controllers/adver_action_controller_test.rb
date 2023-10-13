require "test_helper"

class AdverActionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adver_action_index_url
    assert_response :success
  end

  test "should get update_adver" do
    get adver_action_update_adver_url
    assert_response :success
  end

  test "should get view_adver" do
    get adver_action_view_adver_url
    assert_response :success
  end

  test "should get delete_adver" do
    get adver_action_delete_adver_url
    assert_response :success
  end
end
