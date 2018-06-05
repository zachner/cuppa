class AddBeanDrinkCountToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :bean_drinks_count, :integer
  end
end
