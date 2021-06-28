require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'search, add, and delete friend' do
    visit root_url
    sign_in_as(FactoryBot.create(:user))
    FactoryBot.create(:user)
    fill_in "search", with: "name2"
    click_on 'Search'
    click_on 'add friend'
    fill_in "search", with: "name2"
    click_on 'Search'
  end
end
