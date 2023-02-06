require "test_helper"

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get brands_new_url
    assert_response :success
  end

  test "should get index" do
    get brands_index_url
    assert_response :success
  end
end
