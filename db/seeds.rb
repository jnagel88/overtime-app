User.create!(email:'test@test.com', password:'test123', password_confirmation: 'test123', first_name: 'Jon', last_name:'Snow')

puts "test user created."

100.times do |post|
	Post.create!(date: Date.today, rationale: "rationale #{post}")
	
end
puts "100 posts have been created."