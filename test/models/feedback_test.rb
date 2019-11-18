require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'nil name' do
    f = Feedback.new(name: nil, comment: 'This has a nil name')
    assert_not f.valid?
    assert_not_empty f.errors.messages
  end

  test 'nil comment' do
    f = Feedback.new(name: 'Test', comment: nil)
    assert_not f.valid?
    assert_not_empty f.errors.messages
  end

  test 'valid params' do
    f = Feedback.new(name: 'Test', comment: 'This is a valid feedback')
    assert f.valid?
    assert_empty f.errors.messages
  end
end
