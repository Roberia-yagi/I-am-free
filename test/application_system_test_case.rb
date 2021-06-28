require 'test_helper'
require 'selenium-webdriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |driver_option|
    driver_option.add_argument('no-sandbox')
    driver_option.add_argument('disable-gpu')
    driver_option.add_argument('disable-features=VizDisplayCompositor')
  end
  include SignInHelper
end

