require "test_helper"

class SuperadminDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get superadmin_dashboard_index_url
    assert_response :success
  end

  test "should get campaign_erformance" do
    get superadmin_dashboard_campaign_erformance_url
    assert_response :success
  end

  test "should get contact_interactions" do
    get superadmin_dashboard_contact_interactions_url
    assert_response :success
  end

  test "should get sales_unnel" do
    get superadmin_dashboard_sales_unnel_url
    assert_response :success
  end

  test "should get alerts_and_notifications" do
    get superadmin_dashboard_alerts_and_notifications_url
    assert_response :success
  end

  test "should get campaign_calendar" do
    get superadmin_dashboard_campaign_calendar_url
    assert_response :success
  end
end
