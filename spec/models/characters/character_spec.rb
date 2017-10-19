require 'rails_helper'

RSpec.describe Character, type: :model do
	let(:user) { FactoryGirl.create(:user) }
  let(:character) { FactoryGirl.create(:character, user_id: user.id) }

  describe "character validation" do
  	it "empty username can't be valid" do
  		character.name = ""
  		expect(character).to_not be_valid
  	end
  end
end
