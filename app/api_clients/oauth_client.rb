class OauthClient
  RetrieveTokenError = Class.new(StandardError)

  def retrieve_token(temp_auth_code)
    response = RestClient.post(
      Config.typeform_base_endpoint + '/oauth/token',
      payload(temp_auth_code)
    )

    request_body = JSON.parse(response.body, symbolize_names: true)
    request_body[:access_token]
  rescue RestClient::Exception => exception
    raise RetrieveTokenError, "#{exception.message} #{exception.http_body}"
  end

  private

  def payload(temp_auth_code)
    URI.encode_www_form(
      'code' => temp_auth_code,
      'client_id' => Config.typeform_client_id,
      'client_secret' => Config.typeform_client_secret,
      'redirect_uri' => Config.base_url + '/oauth/token'
    )
  end
end
