class Genre < ApplicationRecord
  has_many :movies

  validates :name, presence: true, uniqueness: true
  before_validation :titlecase

  private

  def titlecase
    self.name = self.name.titleize
  end
end
