require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "should show category listing" do
    get "/categories"
    #to test the link fo that category we need to test the path if it exist in the "show" page, this is done using category_path function using the object and an argument 
    #to find the id of the category
    #the 2 below are the show pages using assert_select "a[href=?]"
    #so it will search for the 2 links matched by the category_path
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end 
end
