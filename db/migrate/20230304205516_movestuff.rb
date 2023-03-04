class Movestuff < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :posts_count
    remove_column :users, :liked_posts_count
    remove_column :users, :topics_count
  end
end
