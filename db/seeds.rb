# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |t|
  User.new(username: "user"+t.to_s, email: "user"+t.to_s+"@gmail.com", password: t.to_s*10, password_confirmation: t.to_s*10)
end

User.all.each do |u|
  u.id
end
