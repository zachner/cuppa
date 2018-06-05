class CreateRoasterFollows < ActiveRecord::Migration
  def change
    create_table :roaster_follows do |t|
      t.integer :user_id
      t.integer :roaster_id

      t.timestamps

    end
  end
end
