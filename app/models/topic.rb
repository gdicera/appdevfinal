# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  posts_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer
#  user_id     :integer
#
class Topic < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  has_many(:posts, { :class_name => "Post", :foreign_key => "topic_id", :dependent => :destroy })

  has_many(:contributions, { :through => :user, :source => :posts })


end