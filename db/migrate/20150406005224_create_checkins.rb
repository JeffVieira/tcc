class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :name
      t.date :date_validity
      t.boolean :checkout
      t.string :notification_period
      t.references :user
      t.references :document_type
      t.references :folder
      t.references :document
      t.integer :status

      t.timestamps null: false
    end
    add_attachment :checkins, :arquivo
  end
end
