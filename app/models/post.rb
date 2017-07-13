class Post < ApplicationRecord
  belongs_to :user
  has_many :likers, through: :like, source: :user
  has_many :comments

  mount_uploader :picture, PictureUploader
end
