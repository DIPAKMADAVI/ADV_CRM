require "test_helper"

class MediaAssetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get media_asset_index_url
    assert_response :success
  end

  test "should get add_asset" do
    get media_asset_add_asset_url
    assert_response :success
  end

  test "should get remove_asset" do
    get media_asset_remove_asset_url
    assert_response :success
  end

  test "should get update_asset" do
    get media_asset_update_asset_url
    assert_response :success
  end
end
