class CreateBeanDrinks < ActiveRecord::Migration
  def change
    create_table :bean_drinks do |t|
      t.integer :bean_id
      t.integer :drink_id

      t.timestamps

    end
  end
end
