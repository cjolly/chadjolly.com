# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::CanonicalHost, ENV['RACK_CANONICAL_HOST'] if ENV['RACK_CANONICAL_HOST']
run ChadJolly::Application
