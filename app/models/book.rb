class Book < ApplicationRecord
  validates :title, presence: :true, length: {minimum: 2, maximum: 140 }
  validates :author, presence: :true, length: {minimum: 2, maximum: 500} 
  validates :genre, presence: :true, length: {minimum: 2, maximum: 500} 
  validates :blurb, presence: :true, length: {minimum: 2, maximum: 500} 

  scope :alpha, -> { order(:title) }

  belongs_to :user
  has_many :comments, :dependent => :destroy #deletes comments associated with a book
  has_many :users, through: :comments

  before_save :titleize_attrs #titleize's attributes automatically

  def titleize_attrs
    self.title = title.titleize
    self.author = author.titleize
    self.genre = genre.titleize
    self.blurb = blurb.titleize
  end 

end
