require 'snitcher'
require 'whois'

task :domain_available do
  unless Whois.whois('chadjolly.com').available?
    Snitcher.snitch(ENV.fetch('SNITCH_ID'))
    puts "snitched!"
  end
end
