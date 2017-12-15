class UpdateForm
  def initialize(menu)
    form_payload = menu.to_form_payload

    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{menu.form}",
      form_payload,
      'Authorization' => Config.auth_token
    )
  rescue RestClient::Exception => err
    puts "Error closing the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be updated'
  end
end
