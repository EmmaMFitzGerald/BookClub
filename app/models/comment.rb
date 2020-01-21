class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: {minimum: 2, maximum: 140 }
  validates :chapter, presence: true

  
  scope :order_by_chapter, -> { order(:chapter) }

end
