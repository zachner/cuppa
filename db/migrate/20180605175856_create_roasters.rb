class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.string :roaster

      t.timestamps

    end
  end
end
