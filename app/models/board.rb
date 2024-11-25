class Board < ApplicationRecord
  has_many :topics
  accepts_nested_attributes_for :topics
  validates :name, :short_name, uniqueness: true, presence: true
  validates :name, length: { minimum: 5 }
  validates :short_name, length: { minimum: 1 }
end
