require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"

# Fetching data from the API
response = URI.open(url).read
movies = JSON.parse(response)['results']

puts "Cleaning Database"
Movie.destroy_all

movies.each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end

puts "#{movies.count} movies created."
