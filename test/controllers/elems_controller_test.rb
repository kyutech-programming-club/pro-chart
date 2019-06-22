require 'test_helper'

class ElemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get elems_index_url
    assert_response :success
  end

  test "should get new" do
    get elems_new_url
    assert_response :success
  end

  test "should get show" do
    get elems_show_url
    assert_response :success
  end

end
