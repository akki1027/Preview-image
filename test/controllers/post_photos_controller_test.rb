require 'test_helper'

class PostPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_photos_index_url
    assert_response :success
  end

  test "should get show" do
    get post_photos_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_photos_edit_url
    assert_response :success
  end

end
