require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before :each do
    @user = User.new(name: 'Omar', photo: 'http://photo.com', bio: 'Hello World!', posts_counter: 5,
                     email: 'eng.omarmuhammad@gmail.com', password: 'asd123')
    @user.skip_confirmation!
    @user.save!
    @post = @user.posts.create(title: 'My new post', text: 'This is my new post', comments_counter: 5, likes_counter: 5)
    @comment = @post.comments.create(author: @user, text: 'Hello, First comment')
    visit user_session_path
    fill_in 'Email', with: 'eng.omarmuhammad@gmail.com'
    fill_in 'Password', with: 'asd123'
    click_button 'Log in'
    visit user_posts_path(@user)
  end

  it 'show post information' do
    expect(page).to have_selector('img', count: 1)
    expect(page).to have_content('Omar')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('My new post')
    expect(page).to have_content('This is my new post')
    expect(page).to have_selector('.post_link', count: 1)
    expect(page).to have_content('comments: 1')
    expect(page).to have_content('Likes: 5')
  end

  it "it redirects to that post's show page" do
    click_on 'My new post'
    expect(page).to have_current_path user_post_path(@user, @post)
  end
end