class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :commentsCounter, default: 0
      t.integer :likesCounter, default: 0
      t.references :author, null: false, foreign_key:{to_table: :users}, index: { name: 'posts_authors' }

      t.timestamps
    end
  end
end
