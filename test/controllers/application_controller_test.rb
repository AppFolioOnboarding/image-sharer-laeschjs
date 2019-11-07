require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'home page allows the user to upload' do
    get root_path
    assert_response :success
    assert_select 'a', 'Upload an Image'
  end

  test 'home page allows the user to see all images' do
    get root_path
    assert_response :success
    assert_select 'a', 'See all Images'
  end
end
