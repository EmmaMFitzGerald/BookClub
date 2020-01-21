class Book < ApplicationRecord
  validates :title, :author, :genre, :blurb, presence: :true, length: {minimum: 2}
  validates :title, uniqueness: :true

  belongs_to :user
  has_many :comments, :dependent => :destroy #deletes comments associated with a book
  has_many :users, through: :comments

  scope :alpha, -> { order(:title) } #display books in alphabetical order

  scope :search, -> (parameter) {where("lower(title) LIKE :search", search: "%#{parameter}%")}

  before_save :titleize_attrs #titleize's attributes automatically

  def titleize_attrs
    self.title = title.titleize
    self.author = author.titleize
    self.genre = genre.titleize
    self.blurb = blurb.titleize
  end 

end
