class AddReadDataDocument < ActiveRecord::Migration
  def change
    add_column :documents, :date_notification, :date
    add_column :document_versions, :date_notification, :date
    add_column :notifications, :read, :boolean, default: false
  end
end
