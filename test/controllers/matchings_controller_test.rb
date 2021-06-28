require 'test_helper'

class MatchingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "layout links" do
    get root_path
    assert_template 'matchings/index'
    assert_select "a[href=?]", root_url
    assert_select "a[href=?]", root_url(:provide)
    assert_select "a[href=?]", "/auth/twitter"
  end
end
