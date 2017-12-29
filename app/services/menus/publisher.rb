module Menus
  class Publisher
    def call(user_id, menu_id)
      menu = Menu.find(menu_id)
      oauth_token = Oauth::TokenRetriever.new.call(user_id)
      form_uid = FormClient.new(oauth_token).create(menu.to_form_payload)
      WebhookClient.new(oauth_token).create(form_uid)
      menu.update(state: 'published', form: form_uid)
    end
  end
end
