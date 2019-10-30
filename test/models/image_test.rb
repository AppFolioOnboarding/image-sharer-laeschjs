require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'nil url' do
    i = Image.new(url: nil)
    refute i.valid?
    assert_not_empty i.errors.messages
  end

  test 'not valid url' do
    i = Image.new(url: 'bad url')
    refute i.valid?
    assert_not_empty i.errors.messages
  end

  test 'valid url' do
    i = Image.new(url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860')
    assert i.valid?
    assert_empty i.errors.messages
  end
end
