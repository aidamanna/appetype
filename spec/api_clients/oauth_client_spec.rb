describe OauthClient do
  describe '#retrieve_token' do
    it 'hits typeform api with the correct parameters' do
      url = Config.typeform_base_endpoint + '/oauth/token'
      expected_oauth_token = 'aBCdE'

      stub_request(:post, url).to_return(
        body: {
          access_token: expected_oauth_token
        }.to_json
      )

      temp_auth_code = 'XyZ'
      oauth_token = OauthClient.new.retrieve_token(temp_auth_code)
      expect(oauth_token).to eql(expected_oauth_token)

      expect(WebMock).to have_requested(:post, url)
        .with(body: URI.encode_www_form(
          'code' => temp_auth_code,
          'client_id' => Config.typeform_client_id,
          'client_secret' => Config.typeform_client_secret,
          'redirect_uri' => Config.base_url + '/oauth/token'
        ))
    end

    it 'raises an exception when the API call is not successful' do
      url = Config.typeform_base_endpoint + '/oauth/token'

      stub_request(:post, url).to_return(status: 400)

      temp_auth_code = 'XyZ'
      expect { OauthClient.new.retrieve_token(temp_auth_code) }.to raise_error(OauthClient::RetrieveTokenError)
    end
  end
end
