ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  #parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # This is a helper method to simulate a user that is logged in 
  def sign_in_as(user)
    #here is where we log in the user using the info needed
    #remember that the session is the key and we need to use the password the we enter, because user.password is actually the hash
    post login_path, params: { session: { email: user.email, password: "password" } }
  end
end
