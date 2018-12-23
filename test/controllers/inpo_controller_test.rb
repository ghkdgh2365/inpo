require 'test_helper'

class InpoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inpo_index_url
    assert_response :success
  end

end
