require "test_helper"

class CustomerOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_orders_show_url
    assert_response :success
  end
end
