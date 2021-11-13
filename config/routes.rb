ChadJolly::Application.routes.draw do
  get '/uptime-ping' => proc { |env| [200, {}, ["OK"]] }
  root to: 'pages#home'
  get '/packers', to: 'pages#packers'
  get '/weather', to: 'pages#weather'
  get '/radio',  to: 'pages#radbuff'
  get '/radbuff', to: redirect('/radio')
  get '/errors', to: 'pages#errors'
  resources :passes

  get '/is_the_shitter_full', to: 'pages#is_the_shitter_full'
  post '/shitters_full', to: 'pages#shitter'

  # Stop the noisy rails logging for missed routes.
  get '/*all' => proc {|env| [404, {}, [] ]}, via: :all
end
