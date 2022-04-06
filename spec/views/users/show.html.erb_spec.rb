require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :each do
    @user = User.new(name: 'Santiago', photo: 'http://photo.com', bio: 'This is me.', posts_counter: 4,
                     email: 'santiagovelosa@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save!
    @user.posts.create(title: 'New Post 1', text: 'This is a new text', comments_counter: 5, likes_counter: 5)
    @user.posts.create(title: 'New Post 2', text: 'This is a new text', comments_counter: 5, likes_counter: 5)
    @user.posts.create(title: 'New Post 3', text: 'This is a new text', comments_counter: 5, likes_counter: 5)
    @user.posts.create(title: 'New Post 4', text: 'This is a new text', comments_counter: 5, likes_counter: 5)
    visit new_user_session_path
    fill_in 'Email', with: 'santiagovelosa@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit user_path(@user)
  end

  it 'show user information' do
    expect(page).to have_selector('img', count: 1)
    expect(page).to have_content('Santiago')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('This is me.')
    expect(page).to have_selector('.userCards', count: 1)
    expect(page).to have_content('New Post 2')
  end

  it "it redirects me to the user's post's index page" do
    click_on('New Post 2')
    expect(page).to have_current_path user_posts_path(@user)
  end
end