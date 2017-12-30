class FormClient < TypeformAPI
  def create(form_payload)
    response = RestClient.post(
      Config.typeform_base_endpoint + '/forms',
      form_payload,
      'Authorization' => oauth_token
    )

    JSON.parse(response.body, symbolize_names: true)[:id]
  rescue RestClient::Exception => err
    puts 'Error publishing the form' \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be created'
  end

  def update(form_uid, form_payload)
    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{form_uid}",
      form_payload,
      'Authorization' => oauth_token
    )
  rescue RestClient::Exception => err
    puts 'Error closing the form' \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be updated'
  end

  def retrieve(form_id)
    response = RestClient.get(Config.typeform_base_endpoint + "/forms/#{form_id}")

    JSON.parse(response.body, symbolize_names: true)
  rescue RestClient::Exception => err
    puts 'Error retrieving form' \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be retrieved'
  end

  private

  attr_reader :oauth_token
end
