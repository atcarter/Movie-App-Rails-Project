class Movie < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  accepts_nested_attributes_for :genre 

  validates :title, presence: true
  validates :synopsis, length: { in: 20..300}
  validates :year, numericality: { greater_than: 1890 }
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
    avg.round(2)
  end

  def genre_attributes=(attribute_hash)
    if !attribute_hash['name'].blank?
      self.genre = Genre.find_or_create_by(attribute_hash)
    end
  end

  private

  def titlecase
    self.title = self.title.titleize
  end
end
