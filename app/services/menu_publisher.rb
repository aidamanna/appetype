class MenuPublisher
  def call(user_id, menu_id)
    menu = Menu.find(menu_id)
    form = Form.from_menu(menu)
    oauth_token = OauthTokenRetriever.new.call(user_id)
    form_uid = FormClient.new(oauth_token).create(form.to_payload)
    WebhookClient.new(oauth_token).create(form_uid)
    menu.update(state: 'published', form: form_uid)
  end
end
