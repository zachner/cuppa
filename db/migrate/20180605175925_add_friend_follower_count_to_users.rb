class AddFriendFollowerCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friend_followers_count, :integer
  end
end
