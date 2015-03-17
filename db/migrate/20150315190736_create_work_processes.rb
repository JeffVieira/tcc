class CreateWorkProcesses < ActiveRecord::Migration
  def change
    create_table :work_processes do |t|
      t.string :name
      t.references :folder

      t.timestamps null: false
    end
  end
end
