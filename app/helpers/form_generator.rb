class FormGenerator
  attr_reader :form_uid

  def initialize(menu)
    form_payload = menu.to_form_payload

    response = RestClient::Request.execute(
      method: :post,
      url: Config.forms_endpoint,
      payload: form_payload,
      headers: {
        'Authorization' => Config.auth_token
      }
    ) { |r| r }

    puts response.body.to_s

    raise 'The form could not be created' if response.code != 201

    @form_uid = JSON.parse(response.body, symbolize_names: true)[:id]
  end
end
