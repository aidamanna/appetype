module Oauth
  class TokenCreator
    def initialize(oauth_client)
      @oauth_client = oauth_client
    end

    def call(user_id, temp_auth_code)
      oauth_token = oauth_client.retrieve_token(temp_auth_code)
      return Token.find_by_user_id(user_id).update(oauth_token: oauth_token) if Token.find_by_user_id(user_id)
      Token.create(user_id: user_id, oauth_token: oauth_token)
    end

    private

    attr_reader :oauth_client
  end
end
