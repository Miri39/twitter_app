require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'users new' do
    get new_user_path
    assert_response :success
    assert_select 'label', 'Email'
    assert_select 'label', 'Password'
  end

  test 'users create - no email and no password' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'George' } }
    assert_response :success
    assert_select 'div', "Password can't be blank"
    assert_select 'div', "Email can't be blank"
    assert_equal User.count, initial_user_count
  end

  test 'users create - no email' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'George', password: '123' } }
    assert_response :success
    assert_equal User.count, initial_user_count
  end

  test 'users create - valid' do
    initial_user_count = User.count
    post users_path, params: { user: { name: 'George', password: '123', email: 'george@ceva.com' } }
    assert_response :ok
    assert_equal User.count, initial_user_count + 1
    user = User.last
    assert_equal user.name, 'George'
  end

  test 'users index' do
    User.create!(email: "test@gmail.com", password: "1234", name: "test", gender: "Other", phone_number: "12033013", age: "55")
    post login_path, params:{email: 'manolee@gmail.com', password: "1234"}
    assert_response :redirect
    get users_path
    assert_response :success
  end

  test 'users from non-logged user' do
    post users_path, params: { user: { name: 'George', password: '123', email: 'george@ceva.com' } }
    assert_response :redirect
  end
end
