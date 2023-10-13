require "test_helper"

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_index_url
    assert_response :success
  end

  test "should get add_cust" do
    get customer_add_cust_url
    assert_response :success
  end

  test "should get update_cust" do
    get customer_update_cust_url
    assert_response :success
  end

  test "should get remove_cust" do
    get customer_remove_cust_url
    assert_response :success
  end
end
