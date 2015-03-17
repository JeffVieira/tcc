class CreateSistemConfigurations < ActiveRecord::Migration
  def change
    create_table :sistem_configurations do |t|
      t.string :notification_period

      t.timestamps null: false
    end
  end
end
