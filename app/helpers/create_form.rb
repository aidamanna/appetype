class CreateForm
  attr_reader :form_uid

  def initialize(menu)
    form_payload = menu.to_form_payload

    response = RestClient.post(
      Config.forms_endpoint,
      form_payload,
      'Authorization' => Config.auth_token
    )

    @form_uid = JSON.parse(response.body, symbolize_names: true)[:id]
  rescue RestClient::Exception => err
    puts "Error publishing the form with id: #{menu.id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be created'
  end
end
