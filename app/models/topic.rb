class Topic < ApplicationRecord
  belongs_to :board
  has_many :reply, dependent: :destroy

  validates :name, :subject, :comment, presence: true
end
