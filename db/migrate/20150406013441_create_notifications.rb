class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :description
      t.references :user
      t.integer :autor_id

      t.timestamps null: false
    end
  end
end
