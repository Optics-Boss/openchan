class User < ApplicationRecord
  enum role: [ :admin, :moderator ]
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
