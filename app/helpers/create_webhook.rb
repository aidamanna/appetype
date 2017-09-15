class CreateWebhook
  def initialize(form_uid)
    webhooks_payload = {
      url: Config.webhook_url,
      enabled: true
    }.to_json

    RestClient.put(
      Config.forms_endpoint + "/#{form_uid}/webhooks/appetype",
      webhooks_payload,
      'Authorization' => Config.auth_token
    )
  rescue RestClient::Exception => err
    puts "Error creating the webhook for the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The webhook cannot be created'
  end
end
