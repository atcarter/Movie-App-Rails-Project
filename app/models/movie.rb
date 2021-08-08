class Movie < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :synopsis, length: { in: 20..300}
  validates :year, numericality: { only_integer: true }
  before_validation :titlecase

  private

  def titlecase
    self.title = self.title.titleize
  end
end
