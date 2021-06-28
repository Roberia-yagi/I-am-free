require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_url

    click_link 'I\'m free now'
  end
end
