require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url1 = 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
    @url2 = 'https://www.sideshow.com/storage/product-images/1000763/darth-vader_star-wars_gallery_5d4b2c7cbcd1b.jpg'
    @url3 = 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/24814f5e-fe9f-44c3-ab13-0c6a3f2a4b9d.jpg'
    Image.create(url: @url1, tag_list: 'test, test2')
    Image.create(url: @url2, tag_list: 'test3, test4')
    Image.create(url: @url3, tag_list: 'test, test3')
  end

  test 'home page allows the user to upload' do
    get root_path
    assert_response :success
    assert_select 'a', 'Upload'
  end

  test 'home page allows the user to filter by tag' do
    get root_path
    assert_response :success
    assert_select 'a', text: 'test', count: 2
    assert_select 'a', text: 'test2', count: 1
    assert_select 'a', text: 'test3', count: 2
    assert_select 'a', text: 'test4', count: 1
    assert_select 'a', text: 'test5', count: 0
  end

  test 'home page filters images by tag' do
    get root_path, params: { search: { tag: 'test' } }
    assert_response :success
    assert_select 'img', 2
  end

  test 'home page allows the user to clear the filter' do
    get root_path, params: { search: { tag: 'test4' } }
    assert_response :success
    assert_select 'a', 'Clear filter'
  end

  test 'home page warns user when there are no images with tag' do
    get root_path, params: { search: { tag: 'test5' } }
    assert_response :success
    assert_select 'h1[id=flash_message]', text: "There are no images with 'test5' as a tag"
  end

  test 'home page shows all of the images' do
    get root_path
    assert_response :success
    assert_select 'img', Image.count

    assert_select 'div#images h1:nth-of-type(1)' do
      assert_select 'h1', "URL: #{@url3}"
    end

    assert_select 'img:nth-of-type(1)' do
      assert_select format('img[src="%<url>s"]', url: @url3)
    end

    assert_select 'div#images h1:nth-of-type(2)' do
      assert_select 'h1', "URL: #{@url2}"
    end

    assert_select 'img:nth-of-type(2)' do
      assert_select format('img[src="%<url>s"]', url: @url2)
    end

    assert_select 'div#images h1:nth-of-type(3)' do
      assert_select 'h1', "URL: #{@url1}"
    end

    assert_select 'img:nth-of-type(3)' do
      assert_select format('img[src="%<url>s"]', url: @url1)
    end
  end

  test 'home should allow user to delete an image' do
    get root_path

    assert_select 'a', 'Delete Image', count: 3
  end
end
