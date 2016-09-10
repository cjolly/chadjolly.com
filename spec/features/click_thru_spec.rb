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

  it "should display the radio page" do
    visit "/radio"
    expect(page).to have_content("Radio Sync")
  end

  it "has error logger URL to document unsupported browsers" do
    visit "/errors?ua=some-unsupported-browser-ua"
    expect(page.body).to be_blank
  end
end
