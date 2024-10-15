class Topic < ApplicationRecord
  belongs_to :board

  validates :name, :subject, :comment, presence: true
end
