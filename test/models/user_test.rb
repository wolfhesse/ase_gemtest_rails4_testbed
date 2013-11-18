require 'test_helper'
class UserTest < ActiveSupport::TestCase
  def noisy?;
    true
  end

  test 'false' do
    Rails.logger.info 'user unittest' if noisy?
    assert !false
  end

  test '4' do
    assert_equal 4, 2+2
  end

  test 'something' do
    Rails.logger.info 'yes'
    assert_equal 4, 4
  end

  test 'user.kleines_u' do
    assert_equal 'u', User.new.kleines_u, 'something'
  end
  test 'user.kleines_a' do
    assert_equal 'a', User.new.kleines_a, 'something'
  end

  test 'user.grosses_a' do
    u=User.new
    assert_equal 'A', u.grosses_a, 'something'
  end
end
