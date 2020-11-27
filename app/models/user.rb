class User < ApplicationRecord
    before_save { self.email = email.downcase }
    #"dependent" this will specify what to do t any depoendent of a User class, 
    #if a user is deleted any articles of that user will be destroyed as well
    has_many :articles, dependent: :destroy 
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum:3, maximum: 25 } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
    
    has_secure_password
     
end 