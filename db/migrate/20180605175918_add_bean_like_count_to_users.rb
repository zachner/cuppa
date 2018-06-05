class AddBeanLikeCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bean_likes_count, :integer
  end
end
