class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy #deletes comments associated with a book
  has_many :users, through: :comments
end
