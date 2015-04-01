class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :permission_code
      t.references :user_group, index: true

      t.timestamps null: false
    end
  end
end
