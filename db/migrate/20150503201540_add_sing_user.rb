class AddSingUser < ActiveRecord::Migration
  def change
    add_column :users, :sing, :text
  end
end
