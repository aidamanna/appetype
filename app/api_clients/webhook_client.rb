class WebhookClient < TypeformApiClient
  def create(form_uid)
    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{form_uid}/webhooks/appetype",
      payload,
      'Authorization' => oauth_token
    )
  rescue RestClient::Exception => err
    puts "Error creating the webhook for the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The webhook cannot be created'
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
