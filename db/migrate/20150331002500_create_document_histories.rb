class CreateDocumentHistories < ActiveRecord::Migration
  def change
    create_table :document_histories do |t|
      t.references :user
      t.references :document
      t.string :action

      t.timestamps null: false
    end
  end
end
