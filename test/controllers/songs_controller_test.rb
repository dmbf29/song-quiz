require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get songs_search_url
    assert_response :success
  end

  test "should get search_two" do
    get songs_search_two_url
    assert_response :success
  end
end
