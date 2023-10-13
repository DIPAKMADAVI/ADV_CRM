require "test_helper"

class CampaignControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campaign_index_url
    assert_response :success
  end

  test "should get create_campaigin" do
    get campaign_create_campaigin_url
    assert_response :success
  end

  test "should get campaign_Progress" do
    get campaign_campaign_Progress_url
    assert_response :success
  end

  test "should get capmaign_analytics" do
    get campaign_capmaign_analytics_url
    assert_response :success
  end
end
