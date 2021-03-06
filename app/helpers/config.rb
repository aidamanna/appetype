module Config
  def self.typeform_client_id
    ENV['TYPEFORM_CLIENT_ID']
  end

  def self.typeform_client_secret
    ENV['TYPEFORM_CLIENT_SECRET']
  end

  def self.base_url
    ENV['BASE_URL']
  end

  def self.typeform_base_endpoint
    'https://api.typeform.com'
  end
end
