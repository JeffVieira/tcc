class CreateProcessTypes < ActiveRecord::Migration
  def change
    create_table :document_processes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
