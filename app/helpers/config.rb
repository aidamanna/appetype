module Config
  def self.auth_token
    ENV['AUTH_TOKEN']
  end

  def self.typeform_client_id
    ENV['TYPEFORM_CLIENT_ID']
  end

  def self.typeform_client_secret
    ENV['TYPEFORM_CLIENT_SECRET']
  end

  def self.base_url
    ENV['BASE_URL']
  end

  def self.webhook_url
    ENV['BASE_URL'] + '/webhooks/orders'
  end

  def self.forms_endpoint
    'https://api.typeform.com/forms'
  end

  def self.typeform_base_endpoint
    'https://api.typeform.com'
  end
end
