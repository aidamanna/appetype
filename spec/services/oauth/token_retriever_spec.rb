describe Oauth::TokenRetriever do
  describe '.call' do
    it 'retrieves the oauth token' do
      token = double(:token)
      allow(Token).to receive(:find_by_user_id).and_return(token)
      expect(token).to receive(:[])

      Oauth::TokenRetriever.call(1)
    end
  end
end
