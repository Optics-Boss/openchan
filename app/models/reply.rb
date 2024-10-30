class Reply < ApplicationRecord
  belongs_to :topic

  validates :name, :comment, presence: true
end
