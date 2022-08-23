require 'rails_helper'

RSpec.describe 'show user tests', type: :feature do
  describe 'test for user index' do
    before(:each) do
      visit '/'
    end
    scenario 'I can see the user profile picture.' do
      first('.user-link').click
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
      first('.user-link').click
      expect(page).to have_content('number of posts')
    end

    scenario 'I can see the user username.' do
      first('.user-link').click
      expect(page).to have_content('username :')
      expect(page).to have_content(@user)
    end

    scenario 'I can see user bio ' do
      first('.user-link').click
      expect(page).to have_content('bio')
    end

    scenario 'When I click to on post i see that post page' do
      first('.user-link').click
      click_link('View All Posts')
      expect(page.current_path).to eql('/users/1/posts')
    end

    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      first('.user-link').click
      first('.view-all').click
      expect(page.current_path).to eql('/users/1/posts')
    end
  end
end
