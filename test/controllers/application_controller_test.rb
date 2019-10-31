require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'Test "/" shows something' do
    get '/'
    assert_equal 200, status
    assert_select 'a', 'Upload'
  end
end
