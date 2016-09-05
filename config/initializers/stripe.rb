require 'stripe'

Stripe.api_key             = ENV['STRIPE_SECRET_KEY'] || "sk_test_UfCh93YfNcfaYR8WNQ1P2fmc"
Stripe.max_network_retries = 2 # default 0
STRIPE_PUBLISHABLE_KEY     = ENV['STRIPE_PUBLISHABLE_KEY'] || "pk_test_npvBLCmPXfBSzFhxDK9vbnH6"
