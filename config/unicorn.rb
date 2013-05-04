# https://devcenter.heroku.com/articles/rails-unicorn
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout Integer(ENV["UNICORN_TIMEOUT"] || 15)
preload_app true

# https://devcenter.heroku.com/articles/forked-pg-connections
before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
