class AddRoasterFollowCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :roaster_follows_count, :integer
  end
end
