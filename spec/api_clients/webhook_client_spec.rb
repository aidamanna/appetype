describe WebhookClient do
  describe '#create' do
    it 'hits typeform api with the correct parameters' do
      form_uid = 'XyZ'
      url = Config.typeform_base_endpoint + "/forms/#{form_uid}/webhooks/appetype"

      stub_request(:put, url)

      oauth_token = 'abcDEfgH'
      WebhookClient.new(oauth_token).create(form_uid)

      expect(WebMock).to have_requested(:put, url)
        .with(headers: { 'Authorization' => oauth_token},
              body: {
                url: Config.base_url + '/webhooks/orders',
                enabled: true
              }.to_json)
    end
  end
end
