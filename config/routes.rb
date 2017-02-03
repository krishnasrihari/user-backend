Rails.application.routes.draw do
  
  scope '/api' do
	resources :users do
	  member do
	    post :create_friend
	  end
	end
	resources :friendships
  end

  get "*path", to: 'root#index'
  root 'root#index'
end
