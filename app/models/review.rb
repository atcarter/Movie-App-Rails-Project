class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, numericality: { less_than: 6, greater_than: 0 }
  validates :content, length: { maximum: 500 }

  scope :order_by_rating, -> { order(rating: :desc)}
end
