require 'rails_helper'

describe 'navigate' do
	before do
		user = User.create(email:"test@test.com", password:"asdasd", password_confirmation: "asdasd", first_name:'Jon',last_name:"Snow")
		login_as(user, scope: :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it "has a title of 'Posts'" do
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of posts' do
  		post1 = Post.create!(date: Date.today, rationale: "post1", user: User.last)
  		post2 = Post.create!(date: Date.today, rationale: "post2", user: User.last)
			visit posts_path
			expect(page).to have_content(/post1|post2/)
		end
	end

	describe "creation" do
		before do
			visit new_post_path
		end

		it "has a new form that can be reached" do
			expect(page.status_code).to eq(200)  
		end
		it "can be created from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "some rationale"
      click_on "Save"

      expect(page).to have_content("some rationale")
		end

		it "will have a user associated with it" do
			fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("user association")
		end
	end



end