require "test_helper"

class ContactLeadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_lead_index_url
    assert_response :success
  end

  test "should get potential_clients" do
    get contact_lead_potential_clients_url
    assert_response :success
  end
  test "should get follow-up_activities" do
    get contact_lead_follow-up_activities_url
    assert_response :success
  end

  test "should get convert_contact" do
    get contact_lead_convert_contact_url
    assert_response :success
  end

  test "should get activity_cracking" do
    get contact_lead_activity_cracking_url
    assert_response :success
  end

  test "should get contact_analytics" do
    get contact_lead_contact_analytics_url
    assert_response :success
  end

  test "should get potential_clients" do
    get contact_lead_potential_clients_url
    assert_response :success
  end
end
