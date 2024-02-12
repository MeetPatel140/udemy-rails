require "test_helper"

module SignInHelper
  def sign_in_as(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end
end
class CreateCategoryTest < ActionDispatch::IntegrationTest
  include SignInHelper

  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@ex.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: " " } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h2.alert-heading'
  end
end
