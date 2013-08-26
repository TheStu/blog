Blog::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {registrations: "registrations"}
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "newsletters/newsletter_sign_up"

  root :to => "statics#home"

  get "statics/home"
  get "/about", to: 'statics#about'
  get 'feed', to: 'posts#feed', as: 'feed'

  resources :gear_guides, path: 'gear-guides', except: :index
  resources :posts do
    collection do
      get 'section/:section', to: 'posts#section', as: 'section', constraints: proc { |req| ['backpacking', 'gear', 'food', 'photography'].include?(req.params[:section]) }
    end
  end
  resources :contact, only: [:new, :create], path: 'contact'
  resources :categories

end
