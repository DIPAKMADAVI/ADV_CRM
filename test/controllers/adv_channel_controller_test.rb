require "test_helper"

class AdvChannelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adv_channel_index_url
    assert_response :success
  end

  test "should get add_channel" do
    get adv_channel_add_channel_url
    assert_response :success
  end

  test "should get update_channel" do
    get adv_channel_update_channel_url
    assert_response :success
  end

  test "should get remove_channel" do
    get adv_channel_remove_channel_url
    assert_response :success
  end
end
