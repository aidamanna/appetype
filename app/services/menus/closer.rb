module Menus
  class Closer
    def call(user_id, menu_id)
      menu = Menu.find(menu_id)
      menu.state = 'closed'
      oauth_token = Oauth::TokenRetriever.call(user_id)
      FormClient.new(oauth_token).update(menu.form, menu.to_form_payload)
      menu.save
    end
  end
end
