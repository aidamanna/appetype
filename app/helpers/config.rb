module Config
  def self.auth_token
    ENV['AUTH_TOKEN']
  end

  def self.forms_endpoint
    'https://api.typeform.com/forms'
  end

  def self.webhook_url
    ENV['WEBHOOK_URL']
  end
end
