require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     postsCounter: 0)
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0)

  subject { Like.new(post:, author: user) }

  before { subject.save }

  it 'likes counter should be incremented' do
    expect(post.likesCounter).to eq 1
  end
end
