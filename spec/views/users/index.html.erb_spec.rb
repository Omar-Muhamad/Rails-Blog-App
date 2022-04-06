require 'rails_helper'

RSpec.describe 'users/index', type: :system, js: true do
  describe 'users index page' do
    before :each do
      user_1 = @user = User.new(name: 'Santiago', photo: 'http://photo.com', bio: 'This is me', posts_counter: 2, email: 'santiagovelosa@gmail.com', password: '123456')
      user_1.skip_confirmation!
      user_1.save!
      user_2 = @user = User.new(name: 'Omar', photo: 'http://photo.com', bio: 'This is me Omar!', posts_counter: 2, email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
      user_2.skip_confirmation!
      user_2.save!
      visit user_session_path

      fill_in 'Email', with: 'santiagovelosa@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it "Shows other users info" do 
      expect(page).to have_content('Omar')
      expect(page).to have_selector('img', count: 2)
      expect(page).to have_content('Number of posts:')
      click_on 'Omar'
      expect(page).to have_current_path user_path(@user)
    end

   
  end
end