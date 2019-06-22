require 'test_helper'

class LangsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get langs_index_url
    assert_response :success
  end

  test "should get new" do
    get langs_new_url
    assert_response :success
  end

  test "should get show" do
    get langs_show_url
    assert_response :success
  end

end
