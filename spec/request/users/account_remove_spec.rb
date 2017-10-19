require 'spec_helper'

describe "Account remove", :js => true do
	let(:user) { FactoryGirl.create(:user) }

	it "cancel account" do
    sign_in(user)

    visit edit_user_registration_path(user)
    accept_alert do
  		click_button('Cancel my account')
		end
   	expect(page).to have_current_path(root_path)
  end
end