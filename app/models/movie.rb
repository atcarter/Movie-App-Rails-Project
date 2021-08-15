class Movie < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :synopsis, length: { in: 20..300}
  validates :year, numericality: { only_integer: true }
  before_validation :titlecase

  scope :order_by_year_desc, -> { order(year: :desc)}
  scope :order_by_year_asc, -> { order(year: :asc)}

  def format
    "#{self.title} (#{self.year})"
  end

  def average_rating
    sum = 0
    count = 0
    self.reviews.each do |rev|
      sum += rev.rating
      count += 1
    end
    avg = sum/count.to_f
    avg
  end

  private

  def titlecase
    self.title = self.title.titleize
  end
end
