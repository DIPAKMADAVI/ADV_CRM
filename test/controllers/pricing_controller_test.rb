require "test_helper"

class PricingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pricing_index_url
    assert_response :success
  end

  test "should get create" do
    get pricing_create_url
    assert_response :success
  end

  test "should get update" do
    get pricing_update_url
    assert_response :success
  end

  test "should get remove" do
    get pricing_remove_url
    assert_response :success
  end
end
