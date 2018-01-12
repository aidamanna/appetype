module OrdersRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'orders' do
        post 'webhooks/orders', to: 'process_webhook#call'
        get 'menus/:id/orders', to: 'show#call', as: 'orders'
      end
    end
  end
end
