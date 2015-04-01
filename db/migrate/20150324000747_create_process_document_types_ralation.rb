class CreateProcessDocumentTypesRalation < ActiveRecord::Migration
  def change
    create_table :document_types_process do |t|
      t.integer :document_type_id
      t.integer :document_process_id
    end
  end
end
