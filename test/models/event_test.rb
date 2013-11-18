require 'test_helper'

def noisy?; true end

Rails.logger.info 'event unittest' if noisy?

class EventTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'kleins a' do
    assert_equal 'a',Event.new.kleins_a
  end

end

