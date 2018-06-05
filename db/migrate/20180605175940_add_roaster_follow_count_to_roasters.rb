class AddRoasterFollowCountToRoasters < ActiveRecord::Migration[5.0]
  def change
    add_column :roasters, :roaster_follows_count, :integer
  end
end
