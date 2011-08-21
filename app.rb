configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
    config.cache_path = 'tmp/sass-cache'
  end

  set :haml, {:format => :html5, :ugly => settings.environment == :production}
  set :sass, Compass.sass_engine_options
end

before do
  redirect to('http://chadjolly.com'), 301 if request.host != 'chadjolly.com' && settings.environment == :production
end

get '/' do
  haml :index
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}")
end
