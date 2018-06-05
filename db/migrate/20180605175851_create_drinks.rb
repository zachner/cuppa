class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink

      t.timestamps

    end
  end
end
