class Category < ApplicationRecord
    #this validation was added because of test "name should be present" from /test/models/category_test file
    validates :name, presence: true, length: { minimum: 3, maximum: 25}

    #this validation was added because of test "name should be unique" from /test/models/category_test file
    validates_uniqueness_of :name
    has_many :article_categories
    has_many :articles, through: :article_categories

end