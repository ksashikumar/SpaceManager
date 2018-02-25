Rails.application.routes.draw do
  resources :stores
  resources :spaces
  match '/spaces/:id/price/:start_date/:end_date' => 'spaces#price_filter', via: :get
  mount SwaggerEngine::Engine, at: "/swagger"
end
