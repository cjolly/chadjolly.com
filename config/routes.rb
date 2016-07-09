ChadJolly::Application.routes.draw do
  get '/uptime-ping' => proc { |env| [200, {}, ["OK"]] }
  root to: 'pages#home'
  get '/packers', to: 'pages#packers'
  get '/weather', to: 'pages#weather'

  # Let's Encrypt!
  # https://github.com/dmathieu/sabayon
  if ENV['ACME_KEY'] && ENV['ACME_TOKEN']
    get ".well-known/acme-challenge/#{ENV["ACME_TOKEN"]}" => proc { [200, {}, [ ENV["ACME_KEY"] ] ] }
  end
end
