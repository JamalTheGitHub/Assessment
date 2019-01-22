namespace :db do

  desc "populates the db"
  task populate: :environment do
    User.destroy_all
    50.times do
      @user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "123"
      )
    end
    Post.destroy_all
    70.times do
      Post.create!(
        title: Faker::Lorem.words(4, 6),
        content: Faker::Lorem.paragraphs,
        user_id: Faker::Number.within(1...50)
      )
    end
  end
end
