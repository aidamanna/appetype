describe OauthTokenCreator do
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
    @user_id = 1
    allow(Token).to receive(:find_by_user_id).with(@user_id).and_return(nil)
  end

  def given_a_user_with_a_oauth_token
    @token = double
    @user_id = 1
    allow(Token).to receive(:find_by_user_id).with(@user_id).and_return(@token)
  end

  def it_gets_the_oauth_token
    oauth_client = double
    allow(OauthClient).to receive(:new).and_return(oauth_client)
    @oauth_token = 'xYZ'
    allow(oauth_client).to receive(:retrieve_token).and_return(@oauth_token)
  end

  def and_it_saves_it_to_the_db
    allow(Token).to receive(:create).with(user_id: @user_id, oauth_token: @oauth_token)
  end

  def and_it_updates_it_in_the_db
    allow(@token).to receive(:update).with(oauth_token: @oauth_token)
  end

  def when_creating_the_oauth_token
    OauthTokenCreator.new.call(@user_id, 'aBc')
  end
end
