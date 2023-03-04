# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#
class Post < ApplicationRecord
  belongs_to(:poster, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  belongs_to(:topic, { :required => true, :class_name => "Topic", :foreign_key => "topic_id", :counter_cache => true })
  has_one(:subject, { :through => :user, :source => :topics })

end
