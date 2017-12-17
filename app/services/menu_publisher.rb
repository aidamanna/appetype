class MenuPublisher
  def call(menu_id)
    menu = Menu.find(menu_id)
    form_uid = CreateForm.new(menu).form_uid
    CreateWebhook.new(form_uid)
    menu.update(state: 'published', form: form_uid)
  end
end
