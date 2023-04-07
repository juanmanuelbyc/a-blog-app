class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key:{to_table: :users}, index: { name: 'likes_authors' }
      t.references :post, null: false, foreign_key:{to_table: :users}, index: { name: 'likes_posts' }

      t.timestamps
    end
  end
end