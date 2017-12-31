module Menus
  class Closer
    def initialize(form_client)
      @form_client = form_client
    end

    def call(menu_id)
      menu = Menu.find(menu_id)
      menu.state = 'closed'
      form_client.update(menu.form, menu.to_form_payload)
      menu.save
    end

    private

    attr_reader :form_client
  end
end
