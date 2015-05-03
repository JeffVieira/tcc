class AddTagDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :tag, :text
    add_column :document_versions, :tag, :text
    add_column :checkins, :tag, :text
  end
end
