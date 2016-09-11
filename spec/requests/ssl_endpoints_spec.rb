require "rails_helper"

# ENV vars set in spec/spec_helper.rb
RSpec.describe "Let's Encrypt SSL challenge routes", type: :request do
  it "responds with private ENV var based on shared token" do
    get "/.well-known/acme-challenge/wile-e"
    expect(response.body).to eq('coyote')
  end

  it "does not route when incorrect token provided" do
    expect {
      get "/.well-known/acme-challenge/meep-meep"
    }.to raise_error(ActionController::RoutingError)
  end
end
