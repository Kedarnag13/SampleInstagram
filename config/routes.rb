Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, controllers: {
    :sessions => 'sessions',
    :omniauth_callbacks => 'omniauth_callbacks'
  }

  get "/show_current_user_feeds" => 'feeds#show_current_user_feeds', as: :show_current_user_feeds
end
