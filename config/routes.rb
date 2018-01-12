Rails.application.routes.draw do
  extend SessionsRoutes
  extend UsersRoutes
  extend OauthRoutes
  extend MenusRoutes
  extend OrdersRoutes
end
