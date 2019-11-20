require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should not create with nil name' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: nil, comment: 'This is valid comment' } }
    end
    assert_equal 'name can\'t be blank', JSON.parse(response.body)['result']
  end

  test 'should not create with nil comment' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: 'Test', comment: nil } }
    end
    assert_equal 'comment can\'t be blank', JSON.parse(response.body)['result']
  end

  test 'should create with good name and comment' do
    assert_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: 'Test', comment: 'Valid comment' } }
    end
    assert_equal 200, status
    assert_equal 'success', JSON.parse(response.body)['result']
  end
end
