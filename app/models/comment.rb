class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: {minimum: 2}
  validates :chapter, presence: true,  numericality: { greater_than: 0 }

  
  scope :order_by_chapter, -> { order(:chapter) } #makes sure notes are kept in chapter order

end
