100.times do |post|
	Post.create!(date: Date.today, rationale: "rationale #{post}")
	
end
puts "100 posts have been created."