require 'rails_helper'

RSpec.describe List, type: :model do
  context "validation of creation a list" do
    it "creation of a list" do
      list = List.create(name: "Drama")

      expect(list).to be_valid
      expect(List.count).to eq(1)
    end

  end

  context "Testing invalidation of creation of a list" do
    it "Invalide" do
      list = List.create()
      list2 = List.create(name: "t")

      expect(list).to be_invalid
      expect(list2).to be_invalid

      expect(List.count).to eq(0)
    end
  end
end
