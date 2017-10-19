# require 'rails_helper'

# describe "Update character" do
#   let(:user) { FactoryGirl.create(:user) }
#   let(:character) { FactoryGirl.create(:character) }

#   it "should update character parameters if user logged in" do
#     sign_in(user)

#     visit edit_character_path(character)
#     fill_in "Name", :with => "new_name"
#     click_button('Update character')
#     expect(page).to have_current_path(character_path(character))
#     expect(page).to have_content("You doesn't update parameters, please try again.")
#     # expect(page).to have_content('You successfuly updated character parameters')
#   end

# end