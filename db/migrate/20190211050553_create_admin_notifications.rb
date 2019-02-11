class CreateAdminNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notifications do |t|
      t.text :text

      t.timestamps
    end
  end
end
