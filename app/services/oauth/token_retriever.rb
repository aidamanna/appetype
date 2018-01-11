module Oauth
  class TokenRetriever
    def self.call(user_id)
      token = Token.find_by_user_id(user_id)
      raise Error::NoOauthToken if token.nil?

      "Bearer #{token[:oauth_token]}"
    end
  end
end
