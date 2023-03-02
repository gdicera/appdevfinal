# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  first_name        :string
#  last_name         :string
#  liked_posts_count :integer
#  password_digest   :string
#  posts_count       :integer
#  profile_picture   :string
#  school_name       :string
#  topics_count      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  post_id           :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:liked_posts, { :class_name => "LikedPost", :foreign_key => "user_id" })
  has_many(:posts, { :class_name => "Post", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:topics, { :class_name => "Topic", :foreign_key => "user_id" })
  has_many(:favorite_posts, { :through => :liked_posts, :source => :post })


  mount_uploader :image, ImageUploader
end
