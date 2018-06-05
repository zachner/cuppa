class AddLikeCountToBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :beans, :likes_count, :integer
  end
end
