# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |i|
  i += 1
  user = User.create(
    email: "user#{i}@example.com",
    password: 'password'
  )

  3.times do |j|
    j += 1
    Prototype.create(
      title: "#{user.email}の記事 その#{j}",
      body: "body#{j} by #{user.email}",
      user_id: user.id
    )

    Like.create(prototype_id: i, user_id: j)
  end
end
