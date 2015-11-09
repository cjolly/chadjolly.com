ChadJolly::Application.routes.draw do
  get '/uptime-ping' => proc { |env| [200, {}, ["OK"]] }
  root to: 'pages#home'
  get '/packers', to: 'pages#packers'
  get '/weather', to: 'pages#weather'
end
