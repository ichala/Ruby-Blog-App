require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'test for user index' do

    scenario ' I can see the username of all other users.' do
        visit '/'
      expect(page).to have_content('john')
    end
    scenario 'I can see the profile picture for each user.' do
        visit '/'
        page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
        visit '/'
      expect(page).to have_content('number of posts: 0')
    end

    scenario 'When I click on a user, I am redirected to that users show page.' do
      visit '/'
      first(".user-link").click
      expect(page).to have_content('View All Posts')
    end
  end
end
