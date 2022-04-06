require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before :each do
    @user = User.new(name: 'Santiago', photo: 'http://photo.com', bio: 'This is me.', posts_counter: 5,
                     email: 'santiagovelosa@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save!
    @post = @user.posts.create(title: 'Post #3', text: 'This is a new text', comments_counter: 5, likes_counter: 5)
    @comment = @post.comments.create(author: @user, text: 'Hello, how are you?')
    visit new_user_session_path
    fill_in 'Email', with: 'santiagovelosa@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit user_post_path(@user, @post)
  end

  it 'show post information' do
    expect(page).to have_content('Post #3')
    expect(page).to have_content('Santiago')
    expect(page).to have_content('comments: 1')
    expect(page).to have_content('Likes: 5')
    expect(page).to have_content('This is a new text')
    expect(page).to have_selector('.comment-details', count: 1)
    expect(page).to have_content('Hello, how are you?')
  end
end
