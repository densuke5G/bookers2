require "test_helper"

class RelaionshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follows" do
    get relaionships_follows_url
    assert_response :success
  end

  test "should get followers" do
    get relaionships_followers_url
    assert_response :success
  end
end
