require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(id: 1, name: 'Fred', bio: 'I am a content creator', photo: '', posts_counter: 0)
    @comment = Comment.new(text: 'Nice Post', author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the author_id is an integer' do
      @comment.author_id = 1
      expect(@comment.author_id).to eq(1)
    end

    it 'validates the post_id is an integer' do
      @comment.post_id = 1
      expect(@comment.post_id).to eq(1)
    end

    it 'validates the comment text' do
      expect(@comment.text).to eq('Nice Post')
    end
  end
end
