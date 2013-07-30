require 'spec_helper'

describe "homepage", js: true do

  before do
    visit root_path
  end

  it "displays the New Venue form via AJAX" do
    click_link "New Venue"

    expect(page).to have_css('form#new_venue')
  end

  it "displays the New Concert form via AJAX" do
    click_link "New Concert"

    expect(page).to have_css('form#new_concert')
  end

  describe "submitting new venue form" do
    it "updates lists of concerts" do
      click_link "New Venue"

      fill_in "Name", with: "The Slowdown"
      click_button "Save Venue"

      expect(page).to_not have_css("form#new_venue")
      expect(page.find('#concerts')).to have_content("The Slowdown")
    end

    it "updates the list of venues for a new concert" do
      click_link "New Venue"

      fill_in "Name", with: "The Fillmore"
      click_button "Save Venue"

      click_link "New Concert"

      expect(page.find('#concert_venue_id')).to have_content("The Fillmore")
    end

  end

  describe "submitting new concert form" do
    it "updates lists of concerts" do
      FactoryGirl.create(:venue, name: "The Slowdown")

      click_link "New Concert"

      fill_in "Artist name", with: "The Mynabirds"
      select('The Slowdown', :from => 'concert_venue_id')

      click_button "Save Concert"

      expect(page).to_not have_css("form#new_concert")
      expect(page.find('#concerts')).to have_content("The Mynabirds")
    end
  end


end
