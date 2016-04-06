require 'snitcher'
require 'whois'

task :domain_available do
  begin
    result = Whois.whois('chadjolly.com')
    @snitch = true unless result.available?
  rescue => error
    @snitch = true
    @message = p error.message
  end

  if @snitch
    Snitcher.snitch(ENV.fetch('SNITCH_ID'), message: @message)
    puts "snitched!"
  end
end
