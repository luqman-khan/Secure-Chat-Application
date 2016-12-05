# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.create([{to: 1, from:2, contact_id:1, message:"Salamualaikum"},{to: 2, from:1, contact_id:1, message:"walaikum salam"}])
	
User.create([{email: "lukku.khan2050@gmail.com", password:"", salt:""},{email: "contact.luqman.khan@gmail.com", password:"", salt:""}])