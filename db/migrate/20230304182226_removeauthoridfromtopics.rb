class Removeauthoridfromtopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :author_id
  end
end
