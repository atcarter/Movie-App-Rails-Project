# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie_id: movies.first)
Review.delete_all
Movie.delete_all
User.delete_all
Genre.delete_all

genre1 = Genre.create(name: "Science Fiction")
genre2 = Genre.create(name: "Horror")

user1 = User.create(username: "tester001")
user2 = User.create(username: "tester002")
user3 = User.create(username: "tester003")
user4 = User.create(username: "tester004")


movie1 = Movie.create(title: "Star Wars: Episode V - The Empire Strikes Back", year: 1980, synopsis: "In this sequel to Star Wars, Luke and the rebels continue their adventure across the galaxy.", genre: genre1)
movie2 = Movie.create(title: "Interstellar", year: 2014, synopsis: "Matthew McConaughey plays a former NASA pilot who is recruited to venture across space and time to save a dying Earth.", genre: genre1)
movie3 = Movie.create(title: "The Thing", year: 1982, synopsis: "At a research base in Antartica, a team of scientists discover something in the ice that never should have been freed..", genre: genre2)
movie4 = Movie.create(title: "Alien", year: 1979, synopsis: "In space, no one can hear you scream. The crew of the Nostromo soon discover this as they cross paths with the deadliest organism in the universe.", genre: genre2)

review1 = Review.create(user_id: user1.id, movie_id: movie1.id, rating: 5, content: "This is a very long-winded way to tell a person that the content of this review is fake and just for testing purposes.")
review11 = Review.create(user_id: user1.id, movie_id: movie2.id, rating: 5, content: "This is a very long-winded way to tell a person that the content of this review is fake and just for testing purposes.")

review2 = Review.create(user_id: user2.id, movie_id: movie1.id, rating: 4, content: "This is a short fake review.")
review22 = Review.create(user_id: user2.id, movie_id: movie2.id, rating: 3, content: "This is another short fake review.")

review3 = Review.create(user_id: user3.id, movie_id: movie3.id, rating: 5, content: "This is a very long-winded way to tell a person that the content of this review is fake and just for testing purposes.")
review33 = Review.create(user_id: user3.id, movie_id: movie4.id, rating: 5, content: "A short and sweet movie review.")

review4 = Review.create(user_id: user4.id, movie_id: movie3.id, rating: 4, content: "This is a short movie review.")
review44 = Review.create(user_id: user4.id, movie_id: movie4.id, rating: 3, content: "This is a very long-winded way to tell a person that the content of this review is fake and just for testing purposes.")


