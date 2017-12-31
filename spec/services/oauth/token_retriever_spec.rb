describe Oauth::TokenRetriever do
  describe '.call' do
    it 'retrieves the oauth token' do
      then_it_returns_then_oauth_token
      when_asking_for_the_users_oauth_token
    end

    def then_it_returns_then_oauth_token
      token = double(:token)
      allow(Token).to receive(:find_by_user_id).and_return(token)
      expect(token).to receive(:[])
    end

    def when_asking_for_the_users_oauth_token
      Oauth::TokenRetriever.call(1)
    end
  end
end
