require 'rails_helper'

RSpec.describe 'show user tests', type: :feature do
  describe 'test for user index' do
    before(:each) do
      visit 'users/97/posts'
      @user = User.find(97)
      @post_data = Post.find(108)
    end

    scenario 'I can see the profile picture for each user.' do
      page.has_selector?('img')
    end

    scenario 'I can see the username ' do
      expect(page).to have_content(@user.name)
    end

    scenario 'I can see the number of posts the user has written ' do
      expect(page).to have_content(@user.postsCounter)
    end

    scenario 'I can see a posts title.' do
      expect(page).to have_content(@post_data.title)
    end

    scenario 'I can see a posts body.' do
      expect(page).to have_content(@post_data.text)
    end

    scenario 'I can first comments on post.' do
      expect(page).to have_content(@post_data.commentsCounter)
    end

    scenario 'I can see the post likes.' do
      expect(page).to have_content(@post_data.likesCounter)
    end

    scenario 'When I click post, it redirects me to the post page.' do
      first('.user-link').click
      expect(page.current_path).to eql("/users/#{@user.id}/posts/#{@post_data.id}")
    end
  end
end
