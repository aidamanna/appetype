describe Typeform::API do
  describe '#form_client' do
    it 'returns an instance of form client' do
      given_a_user
      then_it_returns_a_form_client
      when_asking_for_an_instance_of_form_client
    end

    it 'returns an instance of webhook client' do
      given_a_user
      then_it_returns_a_webhook_client
      when_asking_for_an_instance_of_webhook_client
    end

    def given_a_user
      allow(Oauth::TokenRetriever).to receive(:call)
    end

    def then_it_returns_a_form_client
      expect(FormClient).to receive(:new)
    end

    def when_asking_for_an_instance_of_form_client
      Typeform::API.new(1).form_client
    end

    def then_it_returns_a_webhook_client
      expect(WebhookClient).to receive(:new)
    end

    def when_asking_for_an_instance_of_webhook_client
      Typeform::API.new(1).webhook_client
    end
  end
end
