Blog::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "newsletters/newsletter_sign_up"

  root :to => "statics#home"

  get "statics/home"
  get "/contact", to: 'statics#contact'
  get "/about", to: 'statics#about'

  resources :posts do
    collection do
      get 'section/:section', to: 'posts#section', as: 'section'
    end
  end
  resources :categories

end
