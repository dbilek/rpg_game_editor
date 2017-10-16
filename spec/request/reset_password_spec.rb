require 'rails_helper'
	
describe "Reset password" do
	let(:user) { FactoryGirl.create(:user) }

	it "should send email on reset password" do
    visit "users/sign_in"
    click_link('Forgot your password?')
    expect(page).to have_current_path("/users/password/new")
    visit "/users/password/new"
    fill_in "Email", :with => user.email
    click_button('Send me reset password instructions')
    expect(page).to have_current_path("/users/sign_in")
    expect(page).to have_content("You will receive an email with instructions")
    last_email.to eql(user.email)
  end

  it "show error message if email invalid" do
    visit "users/sign_in"
    click_link('Forgot your password?')
    expect(page).to have_current_path("/users/password/new")
    visit "/users/password/new"
    fill_in "Email", :with => ""
    click_button('Send me reset password instructions')
    expect(page).to have_content("Email can't be blank")
  end
end