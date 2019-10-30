require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_image_path
    assert_response :success
    assert_select 'form'
    assert_select 'label', 'Enter the Image URL:'
    assert_select 'form input[type=submit][value="Save Image"]'
  end
end
