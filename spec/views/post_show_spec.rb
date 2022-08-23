require 'rails_helper'

RSpec.describe 'show user tests', type: :feature do
  describe 'test for user index' do
    before(:each) do
       visit 'users/1/posts/1'
       @post_data = Post.find(1)
      end
    scenario 'I can see the post title.' do
        expect(page).to have_content(@post_data.title)
    end

    scenario 'I can see the post owner ' do
    expect(page).to have_content(@post_data.author.name)
  end


    scenario 'I can see how many comments it has.' do
        expect(page).to have_content(@post_data.commentsCounter)
    end

    scenario 'I can see how many likes it has.' do
        expect(page).to have_content(@post_data.likesCounter)
    end

    scenario 'I can see the post body.' do
        expect(page).to have_content(@post_data.text)
    end

    scenario 'I can see the username of each commentor.' do
        expect(page).to have_content(@post_data.all_comments.first)
    end

    scenario 'I can see the comment each commentor left.' do
        expect(page).to have_content('Comments')
    end

  end
end