require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create new category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      #categories path it is the show page/action from the controller and with post in from it will create the category in the test db
      post categories_path, params: { category: { name: "Sports"} }
      assert_response :redirect
    end
    follow_redirect!   #this is the helper method that will follow the redirect
    assert_response :success
    assert_match "Sports", response.body #we are looking in the show page where we wre redirected for the word "Sports" in the HTML body page
  end
  
  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " "} }
    end
    assert_match "errors", response.body
    #we need the css classes that show this message, it is found in the partial "/app/viewed/shared/_errors.html.erb"
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
