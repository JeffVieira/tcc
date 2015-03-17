class AddPaperclipToDocuments < ActiveRecord::Migration
  def self.up
    add_attachment :documents, :arquivo
  end

  def self.down
    remove_attachment :documents, :arquivo
  end
end
