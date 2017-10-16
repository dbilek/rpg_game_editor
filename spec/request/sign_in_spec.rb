require 'rails_helper'

describe "Sign in user" do
  let(:user) { FactoryGirl.create(:user) }
  
  it "should redirect to home page, with signed in message" do
    visit "users/sign_in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button('Log in')
    expect(page).to have_current_path("/")
    expect(page).to have_content("Signed in successfully.")
  end

  it "should show invalid message if params invalid" do
    visit "users/sign_in"
    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button('Log in')
    expect(page).to have_content("Invalid Email or password.")
  end
end