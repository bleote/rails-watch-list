# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Movie.create(title: 'Wonder Woman 1984', overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s', poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg', rating: 6.9)
# Movie.create(title: 'The Shawshank Redemption', overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison', poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', rating: 8.7)
# Movie.create(title: 'Titanic', overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.', poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.', poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg', rating: 7.0)
# Movie.create(title: 'The Godfather', overview: 'When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.', poster_url: 'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/tmU7GeKVybMWFButWEGl2M4GeiP.jpg', rating: 8.7)
require 'json'
require 'open-uri'

puts 'Cleaning Database'
Movie.destroy_all
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
repos = JSON.parse(response)
movies = repos['results']
top_ten = movies.first(10)


puts 'Fetching data of 10 movies...'
top_ten.each do |movie|
  Movie.create(
    { title: movie['original_title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}" }
  )
end
puts 'Finished!'
