# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  picture     :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :likers, through: :like, source: :user
  has_many :comments

  mount_uploader :picture, PictureUploader
end
