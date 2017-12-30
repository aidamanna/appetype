module Oauth
  class TokenRetriever
    def self.call(user_id)
      "Bearer #{Token.find_by_user_id(user_id)[:oauth_token]}"
    end
  end
end
