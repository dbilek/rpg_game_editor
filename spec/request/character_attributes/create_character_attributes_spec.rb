require 'rails_helper'

describe "Create character attributes", :js => true do
	let(:user) { FactoryGirl.create(:user) }
	let(:character) { FactoryGirl.create(:character, user_id: user.id) }
	let(:character_attribute) { FactoryGirl.create(:character_attribute, character_id: character.id) }

  it "should create character attributes" do
    sign_in(user)

    visit character_path(character.id)
    fill_in "Name", :with => "Power"
    fill_in "Intensity", :with => 60
    attach_file("Upload icon", Rails.root + "spec/fixtures/default_icon.png")
    click_button('Add attribute')
    expect(page).to have_selector :css, '.attribute_1'

  end

end