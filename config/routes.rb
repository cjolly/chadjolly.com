Chadjolly::Application.routes.draw do
  root :to => 'pages#home'
  match 'packers', :to => 'pages#packers'
end
