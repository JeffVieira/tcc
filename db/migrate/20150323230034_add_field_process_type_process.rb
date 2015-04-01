class AddFieldProcessTypeProcess < ActiveRecord::Migration
  def change
    add_column :folders, :process_id, :integer
    add_column :folders, :user_id, :integer
  end
end
