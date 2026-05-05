# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'uri'
require 'net/http'
require 'json'

Movie.destroy_all
List.destroy_all

url = URI("https://tmdb.lewagon.com/movie/top_rated")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'

response = http.request(request)

data = JSON.parse(response.body)
movies = data["results"]

movies.each do |movie|
  movie_image_path = "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}.jpg"
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: movie_image_path,
    rating: movie["vote_average"]
  )
end
