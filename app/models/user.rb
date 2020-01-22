class User < ApplicationRecord
    validates :username, :email, presence: true
    validates :email, :username, uniqueness: true #only allow unique usernames
    
    has_many :books, :dependent => :destroy 
    has_many :comments, :dependent => :destroy 
    has_many :commented_books, through: :comments, source: :book
    has_secure_password
end
