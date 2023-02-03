require "test_helper"

class SupplierOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supplier_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get supplier_orders_show_url
    assert_response :success
  end
end
