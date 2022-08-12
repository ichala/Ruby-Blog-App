require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'john', photo: 'link to photo', bio: 'dev', postsCounter: 0) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts count should be integer' do
    subject.postsCounter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'posts count should be >= 0' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'returns recent posts' do
    Post.create(author: subject, title: 'test', text: 'test', commentsCounter: 0, likesCounter: 0)
    posts = subject.recent_posts
    expect(posts.length).to eq 1
  end
end
