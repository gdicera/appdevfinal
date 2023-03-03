class AddNameToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :name, :string
    add_column :topics, :body, :string
    add_column :topics, :author_id, :string
  end
end
