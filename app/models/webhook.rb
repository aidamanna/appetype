class Webhook < ActiveRecord::Base
  validates :event_id,
            presence: true,
            uniqueness: true

  validates :event_type,
            presence: true

  validates :form_response,
            presence: true
end
