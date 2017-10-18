require 'rails_helper'

describe "Update user parameters" do
  let(:user) { FactoryGirl.create(:user) }
  
  it "update username" do
    sign_in(user)

    visit edit_user_registration_path(user)
    fill_in "Username", :with => "New_name"
    fill_in "Current password", :with => user.password
    click_button('Update')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Your account has been updated successfully.")
  end

  it "do not allow user to update parameters without current password" do
    sign_in(user)

    visit edit_user_registration_path(user)
    fill_in "Username", :with => "New_name"
    fill_in "Current password", :with => ""
    click_button('Update')
    expect(page).to have_content("Current password can't be blank")
  end
end