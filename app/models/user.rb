# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_name           :string
#  account_avatar         :string
#  account_back_ground    :string
#  phone                  :integer
#  signature              :text
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:wechat]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email || "#{auth.uid}@herego.com"
        user.name = auth.info.nickname
        user.portrait_url = auth.info.headimgurl
        user.password = Devise.friendly_token[0,20]
        user.save
      end
  end
  mount_uploader :account_avatar, AccountAvatarUploader
  mount_uploader :account_back_ground, AccountBackGroundUploader

  has_many :posts

  has_many :likes
  has_many :liking_posts, through: :likes, source: :post

  has_many :comments
  has_many :comment_posts, through: :comments, source: :post

  def admin?
    is_admin
  end

  def active!
    self.is_actived_admin = true
    self.save
  end

  def disactive!
    self.is_actived_admin = false
    self.save
  end

  def set_admin!
    self.is_admin = true
    self.save
  end

  def remove_admin!
    self.is_admin = false
    self.save
  end

end
