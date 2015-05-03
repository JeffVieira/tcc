class AlterNotiicationPeriodColumn < ActiveRecord::Migration
  def change
    remove_column :documents, :notification_period
    add_column :documents, :notification_period, :integer, default: 0
  end
end
