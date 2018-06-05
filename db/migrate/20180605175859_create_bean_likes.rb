class CreateBeanLikes < ActiveRecord::Migration
  def change
    create_table :bean_likes do |t|
      t.integer :user_id
      t.integer :bean_id

      t.timestamps

    end
  end
end
