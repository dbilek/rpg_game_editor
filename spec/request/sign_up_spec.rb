require 'rails_helper'

describe "Sign up user" do

  it "should redirect to home page, with welcome message" do
    visit "users/sign_up"
    fill_in "Username", :with => "example_name"
    fill_in "Email", :with => "example@gm.com"
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    click_button('Sign up')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it "should show error message if params invalid" do
    visit "users/sign_up"
    fill_in "Username", :with => ""
    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button('Sign up')
    expect(page).to have_content('The form contain 3 errors')
  end

end