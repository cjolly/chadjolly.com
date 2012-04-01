Chadjolly::Application.routes.draw do
  root :to => 'pages#home'
  match 'packers', :to => 'pages#packers'

  match '/uptime-ping' => proc { |env| [200, {}, ["OK"]] }
end
