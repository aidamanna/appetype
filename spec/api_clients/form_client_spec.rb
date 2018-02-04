describe FormClient do
  describe '#create' do
    it 'hits typeform api with the correct parameters' do
      url = Config.typeform_base_endpoint + '/forms'
      expected_form_uid = 'ABcDe'
      stub_request(:post, url).to_return(body: { id: expected_form_uid }.to_json)

      oauth_token = 'abcDEfgH'
      form_uid = FormClient.new(oauth_token).create({})

      expect(WebMock).to have_requested(:post, url)
      expect(form_uid).to eq(expected_form_uid)
    end

    it 'raises an exception when the API call is not successful' do
      url = Config.typeform_base_endpoint + '/forms'
      stub_request(:post, url).to_return(status: 400)

      oauth_token = 'abcDEfgH'
      expect { FormClient.new(oauth_token).create({}) }.to raise_error(FormClient::CreateFormError)
    end
  end

  describe '#update' do
    it 'hits typeform api with the correct parameters' do
      form_uid = 'XyZ'
      url = Config.typeform_base_endpoint + "/forms/#{form_uid}"
      stub_request(:put, url)

      oauth_token = 'abcDEfgH'
      FormClient.new(oauth_token).update(form_uid, {})

      expect(WebMock).to have_requested(:put, url)
    end

    it 'raises an exception when the API call is not successful' do
      form_uid = 'XyZ'
      url = Config.typeform_base_endpoint + "/forms/#{form_uid}"
      stub_request(:put, url).to_return(status: 400)

      oauth_token = 'abcDEfgH'
      expect { FormClient.new(oauth_token).update(form_uid, {}) }.to raise_error(FormClient::EditFormError)
    end
  end
end
