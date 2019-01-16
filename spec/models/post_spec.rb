require 'rails_helper'

RSpec.describe Post, type: :model do

  context "validations" do
    user = User.new(id: 1,first_name: "First", last_name: "Last", email: "FL@hotmail.com", password: "123")
    it "should create successfully" do
      post = user.posts.build(content: "Content").save
      expect(post).to eq(true)
    end

    it "should fail without content" do
      post = user.posts.build(content: nil).save
      expect(post).to eq(false)
    end

    it "should fail without user_id" do
      post = user.posts.build(user_id: nil).save
      expect(post).to eq(false)
    end
  end
  context 'association tests' do
    it "should belong to user" do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
