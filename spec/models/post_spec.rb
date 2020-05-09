require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    it 'can be created' do
      post = Post.create(title: "test title", body: "test body for post")
      expect(post).to be_valid
    end
  end

  describe 'validation' do
    it "is not valid without a title" do
      post = Post.create(body: "test body for post")
      expect(post).to_not be_valid
    end

    it "is not valid without a body" do
      post = Post.create(title: "test title")
      expect(post).to_not be_valid
    end

    it "is a valid title having less than 50 chars" do
      post = Post.create(title: 'title', body: "test body for post")
      expect(post).to be_valid
    end

    it "is not a valid title having more than 50 chars" do
      post = Post.create(title: 'test title having more than 50 letters in it. This is a very long title', body: "test body for post")
      expect(post).to_not be_valid
    end

    it "is a valid body having less than 200 chars" do
      post = Post.create(title: 'title', body: "test body for post")
      expect(post).to be_valid
    end

    it "is not a valid body having more than 200 chars" do
      post = Post.create(title: 'title', body: "test body for post which has more than 200 letters. test body for post which has more than 200 letters. test body for post which has more than 200 letters. This is a very long body created for testing long body for the post. Post should have limited text in body section for it.")
      expect(post).to_not be_valid
    end
  end
end
