class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.text :text
      t.integer :tag_id, null:false

      t.timestamps null: false
    end
  end
end
