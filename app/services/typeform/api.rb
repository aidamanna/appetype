module Typeform
  class API
    def initialize(user_id)
      @user_id = user_id
    end

    def form_client
      FormClient.new(oauth_token)
    end

    def webhook_client
      WebhookClient.new(oauth_token)
    end

    private

    attr_reader :user_id

    def oauth_token
      @oauth_token ||= Oauth::TokenRetriever.call(user_id)
    end
  end
end
