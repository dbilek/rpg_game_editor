require 'rails_helper'

describe "Create character" do
  let(:user) { FactoryGirl.create(:user) }
  let(:character) { FactoryGirl.create(:character) }

  it "should create character if user logged in" do
    sign_in(user)
    visit new_character_path
    fill_in "Name", :with => "example_name"
    attach_file("Upload avatar", Rails.root + "spec/fixtures/avatar.jpg")
    click_button('Create character')
    expect(page).to have_current_path(characters_path)
    expect(page).to have_content('You created a new character.')
  end
  
  it "shouldn't create character if params invalid" do
    sign_in(user)
    visit new_character_path
    fill_in "Name", :with => ""
    attach_file("Upload avatar", Rails.root + "spec/fixtures/avatar.jpg")
    click_button('Create character')
    expect(page).to have_content("Name can't be blank")
  end

end