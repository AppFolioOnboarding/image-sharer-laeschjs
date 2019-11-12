require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url1 = 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
    @url2 = 'https://www.sideshow.com/storage/product-images/1000763/darth-vader_star-wars_gallery_5d4b2c7cbcd1b.jpg'
    @url3 = 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/24814f5e-fe9f-44c3-ab13-0c6a3f2a4b9d.jpg'
    @image = Image.create(url: @url1, tag_list: 'test, test2')
    Image.create(url: @url2, tag_list: 'test3, test4')
    Image.create(url: @url3, tag_list: 'test, test3')
  end

  test 'should get new' do
    get new_image_path
    assert_response :ok
    assert_select 'form'
    assert_select 'label', 'Enter the Image URL:'
    assert_select 'form input[id="image_url"]'
    assert_select 'label', 'Image Tag:'
    assert_select 'form input[id="image_tag_list"]'
    assert_select 'form input[type=submit][value="Save Image"]'
  end

  test 'should not create with bad url' do
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { url: 'bad url' } }
    end
    assert_equal 400, status
  end

  test 'should create with good url and tags' do
    assert_difference 'Image.count' do
      post images_path, params: { image:
                                    {
                                      url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860',
                                      tag_list: 'test'
                                    } }
    end
    assert_redirected_to image_path(Image.last)
    follow_redirect!
    assert_select '#flash_success_message', 'Image Saved!'
  end

  test 'should show' do
    get image_path(@image)

    assert_response :ok
    assert_select '#image_url', "URL: #{@url1}"
    assert_select '.image_tag', text: 'test', count: 1
    assert_select '.image_tag', text: 'test2', count: 1
    assert_select 'a', 'Delete Image'
    assert_select format('img[src="%<url>s"]', url: @url1)
  end

  test 'should delete' do
    delete image_path(@image)

    assert_redirected_to images_path
    follow_redirect!
    assert_select '#flash_success_message', 'Image Deleted'
  end

  test 'should not delete with bad input' do
    delete image_path(id: -1)

    assert_redirected_to images_path
    follow_redirect!
    assert_select '#flash_error_message', 'Image not found'
  end

  test 'index page allows the user to filter by tag' do
    get images_path
    assert_response :ok
    assert_select 'a', text: 'test', count: 2
    assert_select 'a', text: 'test2', count: 1
    assert_select 'a', text: 'test3', count: 2
    assert_select 'a', text: 'test4', count: 1
    assert_select 'a', text: 'test5', count: 0
  end

  test 'index page filters images by tag and can clear filter' do
    get images_path, params: { search: { tag: 'test' } }
    assert_response :ok
    assert_select 'img', 2
    assert_select 'a', 'Clear filter'
  end

  test 'index page warns user when there are no images with tag' do
    get images_path, params: { search: { tag: 'test5' } }
    assert_response :ok
    assert_select 'h1[id=flash_message]', text: "There are no images with 'test5' as a tag"
  end

  test 'index page shows all of the images' do
    get images_path
    assert_response :ok
    assert_select 'img', Image.count
    assert_select 'a', 'Delete Image', count: Image.count

    assert_select 'div.image_card:nth-of-type(1)' do
      assert_select 'h3', "URL: #{@url3}"
      assert_select format('img[src="%<url>s"]', url: @url3)
    end

    assert_select 'div.image_card:nth-of-type(2)' do
      assert_select 'h3', "URL: #{@url2}"
      assert_select format('img[src="%<url>s"]', url: @url2)
    end

    assert_select 'div.image_card:nth-of-type(3)' do
      assert_select 'h3', "URL: #{@url1}"
      assert_select format('img[src="%<url>s"]', url: @url1)
    end
  end
end
