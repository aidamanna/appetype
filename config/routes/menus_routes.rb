module MenusRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'menus' do
        get 'menus', to: 'index#call', as: 'menus'
        get 'menus/new', to: 'new#call', as: 'new_menu'
        post 'menus', to: 'create#call'
        get 'menus/:id', to: 'show#call', as: 'menu'
        get 'menus/:id/edit', to: 'edit#call', as: 'edit_menu'
        put 'menus/:id', to: 'update#call'
        get 'menus/:id/fill', to: 'fill#call', as: 'fill_menu'
        put 'menus/:id/close', to: 'close#call', as: 'close_menu'
        put 'menus/:id/publish', to: 'publish#call', as: 'publish_menu'
      end
    end
  end
end
