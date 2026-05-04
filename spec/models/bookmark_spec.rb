require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context "creation of a bookmark" do
    it "Validate bookmark" do
      movie = Movie.create(title: "Superman", overview: "First movie of Superman", poster_url: "https://fr.web.img6.acsta.net/c_310_420/img/97/ca/97ca64f4e5790703d0358c61aa7d1a11.jpg")
      list = List.create(name: "Drama")

      bookmark = Bookmark.create(movie: movie, list: list, comment: "i saw on internet")

      expect(bookmark).to be_valid
      expect(Bookmark.count).to eq(1)
    end

    it "Invalidate a bookmark" do
      bookmark = Bookmark.create(comment: "i saw on internet")

      expect(bookmark).to be_invalid
      expect(Bookmark.count).to eq(0)
    end
  end

    context "verify that a List have a bookmark when we add it" do
      it "see if a list have a bookmark" do

        movie = Movie.create(title: "Superman", overview: "First movie of Superman", poster_url: "https://fr.web.img6.acsta.net/c_310_420/img/97/ca/97ca64f4e5790703d0358c61aa7d1a11.jpg")
        list = List.create(name: "Drama")
        Bookmark.create(movie: movie, list: list, comment: "i saw on internet")

        expect(list.bookmarks.count).to eq(1)
      end
    end
end
