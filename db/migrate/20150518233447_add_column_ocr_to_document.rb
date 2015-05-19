class AddColumnOcrToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :ocr_text, :text
    add_column :document_versions, :ocr_text, :text
    add_column :checkins, :ocr_text, :text
  end
end
