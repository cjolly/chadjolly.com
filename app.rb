set :haml, {:format => :html5, :ugly => settings.environment == :production}
set :sass, {:cache_location => 'tmp/sass-cache'}

before do
  redirect to('http://chadjolly.com'), 301 if request.host == 'jollycomputers.com'
end

get '/' do
  haml :index
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}")
end
