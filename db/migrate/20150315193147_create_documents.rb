class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.date :date_validity
      t.boolean :checkout
      t.string :notification_period
      t.references :user
      t.references :document_type
      t.references :folder

      t.timestamps null: false
    end
  end
end
