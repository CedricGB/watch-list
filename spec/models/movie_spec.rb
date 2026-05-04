require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "validate creation of a movie" do
    it "standard creation of a movie" do
      movie = Movie.create(title: "Superman", overview: "First movie of Superman", poster_url: "https://fr.web.img6.acsta.net/c_310_420/img/97/ca/97ca64f4e5790703d0358c61aa7d1a11.jpg")

      expect(movie).to be_valid
      expect(Movie.count).to eq(1)
    end
  end

  context "invalid the creation of a movie" do
    it "when lacking a title or a poster or a overview" do
      movie = Movie.create(overview: "First movie of Superman", poster_url: "https://fr.web.img6.acsta.net/c_310_420/img/97/ca/97ca64f4e5790703d0358c61aa7d1a11.jpg")
      movie2 = Movie.create(title: "Superman", poster_url: "https://fr.web.img6.acsta.net/c_310_420/img/97/ca/97ca64f4e5790703d0358c61aa7d1a11.jpg")
      movie3 = Movie.create(title: "Superman", overview: "First movie of Superman")

      expect(movie).to be_invalid
      expect(movie2).to be_invalid
      expect(movie3).to be_invalid
      expect(Movie.count).to eq(0)
    end
  end
end
