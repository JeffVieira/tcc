class CraeteTableVersionDocument < ActiveRecord::Migration
  def self.up
    remove_column :documents, :document_id

    Document.create_versioned_table
  end
end
