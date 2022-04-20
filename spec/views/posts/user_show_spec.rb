require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'User Index', type: :feature do
  background { visit new_user_session_path }

  scenario 'It should render the title of each post.' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)

    Post.create(title: 'Second post', text: 'lorem ipsum', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
    expect(page).to have_content @post.title
  end

  scenario 'It should rend the author.' do
    @user1 = User.create(name: 'Victor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)

    Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
    expect(page).to have_content @user2.name
  end

  scenario 'It should render the number of comments .' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)
    @coment = Comment.create(text: ' consectetur adipiscing e mollislibero non urna', author_id: @user2.id,
                             post_id: @post.id)

    Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
  end

  scenario 'It should render the number of likes.' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)
    Like.create(author_id: @user2.id, post_id: @post.id)

    Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
  end

  scenario 'It should render the body of the post.' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    Like.create(author_id: @user2.id, post_id: @post.id)

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
    expect(page).to have_content @post.text
  end

  scenario 'It should render the username of each commentor.' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)
    @coment1 = Comment.create(text: ' consectetur adipiscing e mollislibero non urna', author_id: @user2.id,
                              post_id: @post.id)
    @coment2 = Comment.create(text: ' second comment', author_id: @user2.id, post_id: @post.id)
    @coment3 = Comment.create(text: ' third comment', author_id: @user1.id, post_id: @post.id)
    Like.create(author_id: @user2.id, post_id: @post.id)

    Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
    expect(page).to have_content @user1.name
    expect(page).to have_content @user2.name
  end

  scenario 'It should render each commentor .' do
    @user1 = User.create(name: 'VIctor', email: 'barhvictor@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image',
                         bio: 'Rails becomes good lool!')
    @user2 = User.create(name: 'Rails', email: 'rails@gmail.com', password: 'railsrails', confirmed_at: Time.now,
                         photo: 'http/url/image', bio: 'Rails forever')

    @post = Post.create(title: 'First post', text: 'lorem ipsum', author_id: @user2.id)
    @coment1 = Comment.create(text: ' consectetur adipiscing e mollislibero non urna', author_id: @user2.id,
                              post_id: @post.id)
    @coment2 = Comment.create(text: ' second comment', author_id: @user2.id, post_id: @post.id)
    @coment3 = Comment.create(text: ' third comment', author_id: @user1.id, post_id: @post.id)
    Like.create(author_id: @user2.id, post_id: @post.id)

    Post.create(title: 'hello there', text: 'Etiam et mauris et', author_id: @user2.id)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    find("a[href='#{user_path(@user2.id)}']").click
    find("a[href='#{user_posts_path(@user2.id)}']").click
    find("a[href='#{user_post_path(@user2.id, @post.id)}']").click
    expect(page).to have_content @coment1.text
    expect(page).to have_content @coment2.text
  end
end
