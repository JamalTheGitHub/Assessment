class Post < ApplicationRecord
  validates_presence_of :user_id, :content, :title

  belongs_to :user
end
