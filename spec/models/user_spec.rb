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
      expect(user).to be_invalid
    end

    it "doesn't create the user when lacking email" do
      user = User.create(first_name: "Cédric", last_name: "Govaerts", password: "123456")
    end
  end
end
