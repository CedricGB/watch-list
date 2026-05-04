require 'rails_helper'

RSpec.describe User, type: :model do
  context "when valid" do
    it "create the user" do
      user = User.create(first_name: "Cédric", last_name: "Govaerts", email: "cedric@gmail.com", password: "123456")
      expect(user).to be_valid
    end
  end

  context "when invalid" do
    it "doesn't create the user when lacking most of items" do
      user = User.create(first_name: "cédric")
      user_witout_email = User.create(first_name: "Cédric", last_name: "Govaerts", password: "123456")
      user_without_last_name = User.create(first_name: "Cédric", email: "cedric@gmail.com", password: "123456")
      user_without_password = User.create(first_name: "Cédric", last_name: "Govaerts", email: "cedric@gmail.com")

      expect(user).to be_invalid
      expect(user_witout_email).to be_invalid
      expect(user_without_last_name).to be_invalid
      expect(user_without_password).to be_invalid

      expect(User.count).to eq(0)
    end
  end
end
