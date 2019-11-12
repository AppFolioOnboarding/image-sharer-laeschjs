require 'test_helper'

class ApplicationViewTest < ActiveSupport::TestCase
  test 'make tags for one image' do
    url = 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860'
    tags = 'test, test2'
    image = Image.create(url: url, tag_list: tags)
    view_model = ApplicationView.new

    expected_message = 'Tags: <a class="image_tag" href="/images?search%5Btag%5D=test">test</a>,'
    expected_message += ' <a class="image_tag" href="/images?search%5Btag%5D=test2">test2</a>'
    assert_equal expected_message, view_model.make_tags_for_one_image(image)
  end
end
