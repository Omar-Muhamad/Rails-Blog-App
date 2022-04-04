# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Comment.destroy_all
Post.destroy_all
User.destroy_all

users = []
6.times do |index|
  user = User.create(name: "User #{index}", photo:'https://www.pngkit.com/png/full/281-2812821_user-account-management-logo-user-icon-png.png', bio: "This is user #{index} bio")
  users.push(user)
end

p "#{User.count} users created."

posts = []
6.times do |index|
  3.times do |index2|
    post = Post.create(author: users[index], title: "Post #{index2}", text: "This is post number #{index2}")
    posts.push(post)
  end
end

p "#{Post.count} posts created."

# comments = 6.times do |index|
#   3.times do |index2|
#     Comment.create(post: posts[index], author: users[index], text: "Hi There, this is comment number #{index2}." )
#   end
# end

p "#{Comment.count} Comments created."