class MenuPublisher
  def call(user_id, menu_id)
    menu = Menu.find(menu_id)
    form_uid = CreateForm.new(user_id, menu).form_uid
    WebhookClient.new.create(user_id, form_uid)
    menu.update(state: 'published', form: form_uid)
  end
end
