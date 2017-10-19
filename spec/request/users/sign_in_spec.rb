require 'rails_helper'

describe "Sign in user" do
  let(:user) { FactoryGirl.create(:user) }
  
  it "should redirect to home page, with signed in message" do
    visit signin_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button('Log in')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_link("Logout")
    expect(page).to have_link("Edit account")
  end

  it "should show invalid message if params invalid" do
    visit signin_path
    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button('Log in')
    expect(page).to have_content("Invalid Email or password.")
  end
end