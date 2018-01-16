class FormClient < TypeformAPI
  CreateFormError = Class.new(StandardError)
  EditFormError = Class.new(StandardError)
  RetrieveFormError = Class.new(StandardError)

  def create(form_payload)
    response = RestClient.post(
      Config.typeform_base_endpoint + '/forms',
      form_payload,
      'Authorization' => oauth_token
    )

    JSON.parse(response.body, symbolize_names: true)[:id]
  rescue RestClient::Exception => exception
    raise CreateFormError, "#{exception.message} #{exception.http_body}"
  end

  def update(form_uid, form_payload)
    RestClient.put(
      Config.typeform_base_endpoint + "/forms/#{form_uid}",
      form_payload,
      'Authorization' => oauth_token
    )
  rescue RestClient::Exception => exception
    raise EditFormError, "#{exception.message} #{exception.http_body}"
  end

  def retrieve(form_id)
    response = RestClient.get(Config.typeform_base_endpoint + "/forms/#{form_id}")

    JSON.parse(response.body, symbolize_names: true)
  rescue RestClient::Exception => exception
    raise RetrieveFormError, "#{exception.message} #{exception.http_body}"
  end

  private

  attr_reader :oauth_token
end
