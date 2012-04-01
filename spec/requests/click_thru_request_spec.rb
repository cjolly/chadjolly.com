require 'spec_helper'

describe "The Site" do
  it "should display the homepage" do
    visit "/"
    page.should have_content("Chad Jolly")
  end

  it "should display the packers page" do
    visit "/packers"
    page.should have_content("Packers Season Tickets")
  end

  it "should respond to an uptime ping" do
    visit "/uptime-ping"
    page.should have_content("OK")
  end
end
