class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :bean
      t.integer :roaster_id

      t.timestamps

    end
  end
end
