# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
	name: "Nathan Justice",
	email: "nathanjustice@gmail.com",
	password: "password",
	password_confirmation: "password",
	admin: true
)

User.create!(
	name: "Bob Ross",
    email: "bobross@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: false
)

User.create!(
	name:  "Darth Vader",
    email: "darthvader@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: false
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "First",
	hours: 0,
	minutes: 30,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Second",
	hours: 0,
	minutes: 45,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Third",
	hours: 1,
	minutes: 0,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Fourth",
	hours: 1,
	minutes: 5,
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Fifth",
	hours: 0,
	minutes: 37,
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Sixth",
	hours: 1,
	minutes: 5,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Seventh",
	hours: 0,
	minutes: 54,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Eighth",
	hours: 0,
	minutes: 70,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Ninth",
	hours: 0,
	minutes: 0,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 1,
	author: "Nathan Justice",
	title: "Tenth",
	hours: 0,
	minutes: 5,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "First",
	hours: 3,
	minutes: 30,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "Second",
	hours: 0,
	minutes: 45,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "Third",
	hours: 0,
	minutes: 45,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "Fourth",
	hours: 0,
	minutes: 20,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "Fifth",
	hours: 0,
	minutes: 8,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 2,
	author: "Bob Ross",
	title: "Sixth",
	hours: 0,
	minutes: 54,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 3,
	author: "Darth Vader",
	title: "First",
	hours: 1,
	minutes: 15,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 3,
	author: "Darth Vader",
	title: "Second",
	hours: 0,
	minutes: 15,
	created_at: (rand*10).days.ago
)

Micropost.create!(
	user_id: 3,
	author: "Darth Vader",
	title: "Third",
	hours: 0,
	minutes: 15,
	created_at: (rand*10).days.ago
)