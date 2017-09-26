require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get rake" do
    get users_rake_url
    assert_response :success
  end

  test "should get db:rollback" do
    get users_db:rollback_url
    assert_response :success
  end

end
