class MenuPublisher
  def call(user_id, menu_id)
    menu = Menu.find(menu_id)
    form_uid = FormClient.new.create(user_id, menu)
    WebhookClient.new.create(user_id, form_uid)
    menu.update(state: 'published', form: form_uid)
  end
end
