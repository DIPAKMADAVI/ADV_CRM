require "test_helper"

class MasterConfigurationControllerTest < ActionDispatch::IntegrationTest
  test "should get media_asset" do
    get master_configuration_media_asset_url
    assert_response :success
  end

  test "should get pricing" do
    get master_configuration_pricing_url
    assert_response :success
  end

  test "should get department" do
    get master_configuration_department_url
    assert_response :success
  end

  test "should get adv_channel" do
    get master_configuration_adv_channel_url
    assert_response :success
  end

  test "should get roles" do
    get master_configuration_roles_url
    assert_response :success
  end
end
