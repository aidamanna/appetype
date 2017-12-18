class FormClient
  def create(user_id, menu)
    response = RestClient.post(
      Config.typeform_base_endpoint + '/forms',
      payload(menu),
      'Authorization' => OauthTokenRetriever.new.call(user_id)
    )

    JSON.parse(response.body, symbolize_names: true)[:id]
  rescue RestClient::Exception => err
    puts "Error publishing the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be created'
  end

  def update(user_id, menu)
    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{menu.form}",
      payload(menu),
      'Authorization' => OauthTokenRetriever.new.call(user_id)
    )
  rescue RestClient::Exception => err
    puts "Error closing the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be updated'
  end

  def retrieve(form_id)
    response = RestClient.get(Config.typeform_base_endpoint + "/forms/#{form_id}")

    JSON.parse(response.body, symbolize_names: true)
  rescue RestClient::Exception => err
    puts "Error retrieving form with id: #{form_id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be retrieved'
  end

  def payload(menu)
    menu.to_form_payload
  end
end
