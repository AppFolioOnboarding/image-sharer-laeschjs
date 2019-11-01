require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @image = Image.new(url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_1000x1000_$&$product=PartyCity/P590860')
    @tags = %w[test test2]
  end

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
    assert @image.valid?
    assert_empty @image.errors.messages
  end

  test 'image contains tags as array' do
    @image.tag_list = @tags
    @image.save
    @image.reload
    @image.tags.each_with_index do |tag, index|
      assert_equal tag.name, @tags[index]
    end
  end

  test 'image contains tags as string' do
    @image.tag_list = 'test, test2'
    @image.save
    @image.reload
    @image.tags.each_with_index do |tag, index|
      assert_equal tag.name, @tags[index]
    end
  end
end
