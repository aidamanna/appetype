describe Oauth::TokenCreator do
  describe '#call' do
    it 'saves the oauth token when there is no previous one' do
      given_a_user_without_a_oauth_token
      it_gets_the_oauth_token
      and_it_saves_it_to_the_db
      when_creating_the_oauth_token
    end

    it 'updates the oauth token when there is a previous one' do
      given_a_user_with_a_oauth_token
      it_gets_the_oauth_token
      and_it_updates_it_in_the_db
      when_creating_the_oauth_token
    end
  end

  private

  def given_a_user_without_a_oauth_token
    allow(Token).to receive(:find_by_user_id).and_return(nil)
  end

  def given_a_user_with_a_oauth_token
    @token = double(:token)
    allow(Token).to receive(:find_by_user_id).and_return(@token)
  end

  def it_gets_the_oauth_token
    @oauth_client = double(:oauth_client)
    expect(@oauth_client).to receive(:retrieve_token)
  end

  def and_it_saves_it_to_the_db
    expect(Token).to receive(:create)
  end

  def and_it_updates_it_in_the_db
    expect(@token).to receive(:update)
  end

  def when_creating_the_oauth_token
    Oauth::TokenCreator.new(@oauth_client).call(1, 'aBc')
  end
end
