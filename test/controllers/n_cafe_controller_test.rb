require 'test_helper'

class NCafeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get n_cafe_index_url
    assert_response :success
  end

end
