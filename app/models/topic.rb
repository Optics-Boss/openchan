class Topic < ApplicationRecord
  belongs_to :board
  has_many :reply

  validates :name, :subject, :comment, presence: true
end
