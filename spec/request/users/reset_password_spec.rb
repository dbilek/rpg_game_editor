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

  it "go to reset password page with token, to add new password" do
    reset_token = user.send_reset_password_instructions
    visit edit_user_password_path(user, reset_password_token: reset_token)
    fill_in "New password", :with => "newpassword"
    fill_in "Confirm new password", :with => "newpassword"
    click_button('Change my password')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Your password has been changed successfully. You are now signed in.")
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