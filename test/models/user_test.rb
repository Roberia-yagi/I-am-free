require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(provider: 'twitter', uid: '111', username: 'Test', image_url: 'aaa.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'provider should be present' do
    @user.provider = nil
    assert_not @user.valid?
  end

  test 'uid should be present' do
    @user.uid = nil
    assert_not @user.valid?
  end

  test 'username should be present' do
    @user.username = nil
    assert_not @user.valid?
  end

  test 'image_url should be present' do
    @user.image_url = nil
    assert_not @user.valid?
  end
end
