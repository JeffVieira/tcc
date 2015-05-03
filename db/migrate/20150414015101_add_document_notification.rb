class AddDocumentNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :document_id, :integer
  end
end
