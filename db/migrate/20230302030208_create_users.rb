class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :post_id
      t.string :profile_picture
      t.string :school_name
      t.integer :liked_posts_count
      t.integer :posts_count
      t.integer :topics_count

      t.timestamps
    end
  end
end
