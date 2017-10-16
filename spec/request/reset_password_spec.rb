require 'rails_helper'
	
describe "Reset password" do
	let(:user) { FactoryGirl.create(:user) }

	it "should send email on reset password" do
    visit signin_path
    click_link('Forgot your password?')
    expect(page).to have_current_path(new_user_password_path)
    fill_in "Email", :with => user.email
    click_button('Send me reset password instructions')
    expect(page).to have_current_path(signin_path)
    expect(page).to have_content("You will receive an email with instructions")
    last_email.to eql(user.email)
  end

  it "show error message if email invalid" do
    visit signin_path
    click_link('Forgot your password?')
    expect(page).to have_current_path(new_user_password_path)
    fill_in "Email", :with => ""
    click_button('Send me reset password instructions')
    expect(page).to have_content("Email can't be blank")
  end
end