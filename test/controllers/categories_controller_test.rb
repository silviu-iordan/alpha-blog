require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Literature")
    @admin_user = User.create(username: "johndoe@example.com", email: "johndoe@example.com", password: "password", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    #first we will sign in as admin user using the method from test/test_helper.rb
    sign_in_as(@admin_user) 
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    #we need to sign the user in again because we after every test the db info is deleted
    sign_in_as(@admin_user)
    assert_difference('Category.count',1) do
      #the verb assiciated with "create" something is actualy a "post" action
      #very important, we create here the categor "Travel" but this is a test database, so it will not hit the production database
      #to hist the production database we need to create it from browser and start the rails console verify it
      post categories_url, params: { category: {  name: "Travel"} }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: {  name: "Travel"} }
    end

    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
