class UserInvitation < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  self.primary_key = :token

  before_save { self.email = email.downcase }

  validates :token,
            presence: true,
            uniqueness: true
  validates :email,
            presence: true,
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end
