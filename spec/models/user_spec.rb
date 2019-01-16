require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it "should save and sign up" do
      user = User.new(first_name: "First", last_name: "Last", email: "FL@gmail.com", password: "123").save
      expect(user).to eq(true)
    end

    it "it is not valid without first_name" do
      user = User.new(last_name: "Last", email: "FL@gmail.com", password: "123").save
      expect(user).to eq(false)
    end
    it "it is not valid without last_name" do
      user = User.new(first_name: "First", email: "FL@gmail.com", password: "123").save
      expect(user).to eq(false)
    end
    it "it is not valid without email" do
      user = User.new(first_name: "First", last_name: "Last", password: "123").save
      expect(user).to eq(false)
    end
    it "it is not valid without password" do
      user = User.new(first_name: "First", last_name: "Last", email: "FL@gmail.com").save
      expect(user).to eq(false)
    end
  end

  context 'association tests' do
    it "should have many posts" do
      t = User.reflect_on_association(:posts)
      expect(t.macro).to eq(:has_many)
    end
  end
end
