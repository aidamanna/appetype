class Token < ActiveRecord::Base
  self.primary_key = :user_id

  validates :user_id,
            presence: true,
            uniqueness: true
  validates :oauth_token,
            presence: true,
            uniqueness: true
end
