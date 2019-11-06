require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
    tags = 'test, test2'
    @image = Image.create(url: @url, tag_list: tags)
  end
  test 'should get new' do
    get new_image_path
    assert_response :success
    assert_select 'form'
    assert_select 'label', 'Enter the Image URL:'
    assert_select 'form input[id="image_url"]'
    assert_select 'label', 'Image Tag:'
    assert_select 'form input[id="image_tag_list"]'
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
    follow_redirect!
    assert_select '#flash_message', 'Image Saved!'
  end

  test 'should create with tags' do
    assert_difference 'Image.count' do
      post images_path, params: { image:
                                    {
                                      url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860',
                                      tag_list: 'test'
                                    } }
    end
    assert_redirected_to image_path(Image.last)
  end

  test 'should show' do
    get image_path(@image)

    assert_response :success
    assert_select '#image_url', "URL: #{@url}"
    assert_select '.image_tag', text: 'test', count: 1
    assert_select '.image_tag', text: 'test2', count: 1
    assert_select format('img[src="%<url>s"]', url: @url)
  end

  test 'should delete' do
    delete image_path(@image)

    assert_redirected_to root_path
    follow_redirect!
    assert_select '#flash_success_message', 'Image Deleted'
  end

  test 'should not delete with bad input' do
    delete image_path(id: 1000)

    assert_redirected_to root_path
    follow_redirect!
    assert_select '#flash_error_message', 'Image not found'
  end
end
