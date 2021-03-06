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

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  def is_liked_by?(user)
    likers.include?(user)
  end

  def like_by!(user)
    likers << user
  end

  def dislike_by!(user)
    likers.delete(user)
  end

  scope :recent, -> { order('created_at DESC') }

end
