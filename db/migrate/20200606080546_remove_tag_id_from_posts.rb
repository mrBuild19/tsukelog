class RemoveTagIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tag_id, :integer
  end
end
