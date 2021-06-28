ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative 'sign_in_helper'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(_user, options = {})
    provider = options[:provider] || 'twitter'
  end
end
