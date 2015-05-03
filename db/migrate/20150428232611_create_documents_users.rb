class CreateDocumentsUsers < ActiveRecord::Migration
  def change
    create_table :document_users do |t|
      t.integer :user_id
      t.integer :document_id

      t.timestamps null: false
    end
  end
end
