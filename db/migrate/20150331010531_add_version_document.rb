class AddVersionDocument < ActiveRecord::Migration
  def change
    add_column :documents, :document_id, :integer
  end
end
