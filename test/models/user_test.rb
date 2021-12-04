require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'bad email' do
    user = User.new(name: 'Dan', email: 'Dan@example.com', password: '123456')
    assert !user.valid?
  end
  test 'valid user' do
    user = User.new(name: 'John', email: 'dan.1@osu.edu', password: '123456')
    assert user.valid?
  end
  test 'short pass' do
    user = User.new(name: 'John', email: 'john@example.com', password: '12345')
    assert !user.valid?
  end
    #check if things are being assigned and can be accessed.
  test 'check name' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    assert_equal("Dan", user.name)
  end
  test 'check name wrong' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    refute_equal("Danny", user.name)
  end
  test 'check pass' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    assert_equal("123456", user.password)
  end
  test 'check pass wrong' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    refute_equal("123", user.password)
  end
  test 'check email' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    assert_equal("dan.1@osu.edu", user.email)
  end
  test 'check email wrong' do
    user = User.new(name: 'Dan', email: 'dan.1@osu.edu', password: '123456')
    refute_equal("dan.2@osu.edu", user.email)
  end
end
