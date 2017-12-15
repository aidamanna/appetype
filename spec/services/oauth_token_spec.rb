describe OauthToken do
  describe '#call' do
    it 'gets a token' do
      it_gets_the_token
      and_it_saves_it_to_the_db
      when_retrieving_the_token
    end
  end

  private

  def it_gets_the_token
    oauth_client = double
    allow(OauthClient).to receive(:new).and_return(oauth_client)
    @token = 'xYZ'
    allow(oauth_client).to receive(:retrieve_token).and_return(@token)
  end

  def and_it_saves_it_to_the_db
    setting = double
    allow(Setting).to receive(:find_by_name).with(:auth_token).and_return(setting)
    allow(setting).to receive(:update).with(value: @token)
  end

  def when_retrieving_the_token
    OauthToken.new.call('aBc')
  end
end
