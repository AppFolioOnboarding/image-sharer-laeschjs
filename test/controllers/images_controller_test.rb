require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_image_path
    assert_response :success
    assert_select 'form'
    assert_select 'label', 'Enter the Image URL:'
    assert_select 'form input[type=submit][value="Save Image"]'
  end

  test 'should not create' do
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: 'bad url' } }
    end
    assert_equal 400, status
  end

  test 'should create' do
    assert_difference 'Image.count' do
      post images_path, params: { image:
                                    {
                                      url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
                                    } }
    end
    assert_redirected_to image_path(Image.last)
  end
end
