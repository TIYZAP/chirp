Rails.application.routes.draw do

  scope '/api' do
    resources :users
    resources :shouts
    post '/log_in' => 'users#log_in'
    post '/signup' => 'users#create'
    get '/all' => 'users#index'
    post '/follow' => 'users#follow_user'
    post '/unfollow' => 'users#unfollow_user'
    get '/allfollowers' => 'users#all_followers'
  end

end
