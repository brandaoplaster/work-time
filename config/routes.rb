Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  devise_scope :user do
    authenticated :user do
      root to: redirect('/weekdays'), as: :authenticated_root
      
      resources :weekdays, format: false do
        collection do
          post 'add_time', action: :add_time
        end
      end
    end

    unauthenticated do
      root to: 'pages#index', as: :unauthenticated_root
    end
  end
end
