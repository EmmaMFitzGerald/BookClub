class Book < ApplicationRecord
  validates :title, presence: :true, length: {minimum: 2, maximum: 140 }
  validates :author, presence: :true, length: {minimum: 2, maximum: 500} 
  validates :genre, presence: :true, length: {minimum: 2, maximum: 500} 
  validates :blurb, presence: :true, length: {minimum: 2, maximum: 500} 

  scope :alpha, -> { order(:title) }

  belongs_to :user
  has_many :comments, :dependent => :destroy #deletes comments associated with a book
  has_many :users, through: :comments
end
