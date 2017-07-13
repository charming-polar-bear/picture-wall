class Post < ApplicationRecord
  belongs_to :user
  has_many :likers, through: :like, source: :user
  has_many :comments
end
