require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url1 = 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
    @url2 = 'https://www.sideshow.com/storage/product-images/1000763/darth-vader_star-wars_gallery_5d4b2c7cbcd1b.jpg'
    @url3 = 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/24814f5e-fe9f-44c3-ab13-0c6a3f2a4b9d.jpg'
    Image.create(url: @url1)
    Image.create(url: @url2)
    Image.create(url: @url3)
  end

  test 'home page allows the user to upload' do
    get root_path
    assert_equal 200, status
    assert_select 'a', 'Upload'
  end

  test 'home page shows all of the images' do
    get root_path
    assert_equal 200, status
    assert_select 'img', Image.count

    assert_select 'h1:nth-child(1)' do
      assert_select 'h1', "URL: #{@url3}"
    end

    assert_select 'img:nth-child(2)' do
      assert_select format('img[src="%<url>s"]', url: @url3)
    end

    assert_select 'h1:nth-child(3)' do
      assert_select 'h1', "URL: #{@url2}"
    end

    assert_select 'img:nth-child(4)' do
      assert_select format('img[src="%<url>s"]', url: @url2)
    end

    assert_select 'h1:nth-child(5)' do
      assert_select 'h1', "URL: #{@url1}"
    end

    assert_select 'img:nth-child(6)' do
      assert_select format('img[src="%<url>s"]', url: @url1)
    end
  end
end
