ChadJolly::Application.routes.draw do
  get '/uptime-ping' => proc { |env| [200, {}, ["OK"]] }
  root to: 'pages#home'
  get '/packers', to: 'pages#packers'
  get '/weather', to: 'pages#weather'
  get '/radio',  to: 'pages#radbuff'
  get '/radbuff', to: redirect('/radio')
  get '/errors', to: 'pages#errors'
  resources :passes

  # Let's Encrypt!
  # https://github.com/dmathieu/sabayon
  ENV.each do |var, _|
    next unless var.start_with?("ACME_TOKEN_")
    number = var.sub(/ACME_TOKEN_/, '')
    get ".well-known/acme-challenge/#{ ENV["ACME_TOKEN_#{number}"] }" => proc { [200, {}, [ ENV["ACME_KEY_#{number}"] ] ] }
  end

  # Stop the noisy rails logging for missed routes.
  get '/*all' => proc {|env| [404, {}, [] ]}, via: :all
end
