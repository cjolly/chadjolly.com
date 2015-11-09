require 'spec_helper'

describe "The Site" do
  it "should display the homepage" do
    visit "/"
    expect(page).to have_content("Chad Jolly")
  end

  it "should display the packers page" do
    visit "/packers"
    expect(page).to have_content("Packers Season Tickets")
  end

  it "should respond to an uptime ping" do
    visit "/uptime-ping"
    expect(page).to have_content("OK")
  end

  it "should display the weather page for dad" do
    visit "/weather"
    expect(page).to have_content("Jolly Weather Station")
  end
end
