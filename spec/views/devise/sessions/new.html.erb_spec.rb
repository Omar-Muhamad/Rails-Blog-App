require 'rails_helper'

RSpec.describe 'devise/sessions/new', type: :system, js: true do
  describe 'login page' do
    before :each do
      @user = User.new(name: 'Santiago', photo: 'http://photo.com', bio: 'This is me', posts_counter: 2, email: 'santiagovelosa@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save!
      visit user_session_path
    end

    it 'displays the login form' do
      expect(page).to have_button('Log in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end

    it "doesn't submit form if fields are empty when logging in" do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end

    it "doesn't submit form if fields don't have valid format" do
      fill_in 'Email', with: 'santiagovelosa'
      fill_in 'Password', with: '123'
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end

    it "redirects to home page if user info is valid" do
      fill_in 'Email', with: 'santiagovelosa@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end