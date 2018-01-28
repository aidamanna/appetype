module Menus
  class Closer
    def initialize(form_client)
      @form_client = form_client
    end

    def call(menu_id)
      menu = Menu.find(menu_id)
      raise Error::MenuStatus, 'The menu status is not published and cannot be closed' unless menu.published?
      menu.close
      form = Form.from_menu(menu)
      form_client.update(menu.form, form.to_payload)
      menu.save
    end

    private

    attr_reader :form_client
  end
end
