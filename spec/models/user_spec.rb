require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:second_user) { FactoryGirl.build(:user, email: user.email) }
  let(:third_user) { FactoryGirl.build(:user, username: user.username) }

  describe "user validation" do
    
    it "is not valid with invalid email" do
      user.email = "mail@example"
      expect(user).to_not be_valid
    end

    it "shouldn't be empty username" do
      user.username = ""
      expect(user).to_not be_valid
    end

    it "username shouldn't have more than 50 characters" do
      user.username = "a" * 51
      expect(user).to_not be_valid
    end

    it "shouldn't be empty password" do
      user.password = ""
      expect(user).to_not be_valid
    end

    it "should be uniqueness email" do
      expect(second_user).to_not be_valid
    end

    it "should be uniqueness username" do
      expect(third_user).to_not be_valid
    end

  end
end
