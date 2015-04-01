class AddStatusDocumentoProcesso < ActiveRecord::Migration
  def change
    add_column :documents, :status, :integer
    add_column :document_processes, :status, :integer
  end
end
