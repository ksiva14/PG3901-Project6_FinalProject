require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include SessionsHelper
  setup do
    @user = User.new id: 1, name: 'ZJ', email: 'tan.955@osu.edu', password_digest: 'password'
    Student.create user_id: @user.id
  end
end
