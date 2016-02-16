

require 'test_helper'


def setup
  ActionMailer::Base.deliveries.clear
end


class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { roll_number:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { roll_number:  "101303110",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    # assert_template 'users/show'
    # assert is_logged_in?
  end
end
