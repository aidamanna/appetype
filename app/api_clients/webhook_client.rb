class WebhookClient < TypeformAPI
  CreateWebhookError = Class.new(StandardError)

  def create(form_uid)
    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{form_uid}/webhooks/appetype",
      payload,
      'Authorization' => oauth_token
    )
  rescue RestClient::Exception => exception
    raise CreateWebhookError, "#{exception.message} #{exception.http_body}"
  end

  private

  attr_reader :oauth_token

  def payload
    {
      url: Config.base_url + '/webhooks/orders',
      enabled: true
    }.to_json
  end
end
