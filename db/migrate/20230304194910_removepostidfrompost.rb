class Removepostidfrompost < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :post_id
  end
end
