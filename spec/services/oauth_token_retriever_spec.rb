describe OauthTokenRetriever do
  describe '#call' do
    it 'retrieves the token' do
      user_id = 1
      token = double
      allow(Token).to receive(:find_by_user_id).with(user_id).and_return(token)
      allow(token).to receive(:[])

      OauthTokenRetriever.new.call(user_id)
    end
  end
end
