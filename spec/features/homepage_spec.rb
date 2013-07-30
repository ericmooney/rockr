require 'spec_helper'

describe "homepage", js: true do
  it "displays the New Venue form via AJAX" do
    visit root_path

    click_link "New Venue"

    expect(page).to have_css('form#new_venue')
  end

  it "displays the New Concert form via AJAX" do
    visit root_path

    click_link "New Concert"

    expect(page).to have_css('form#new_concert')
  end
end
