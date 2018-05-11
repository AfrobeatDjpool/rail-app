require 'test_helper'

class PadronTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get padron_test_index_url
    assert_response :success
  end

end
