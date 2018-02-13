class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.string :type_alert
      t.varchar :message
      t.date :created_at

      t.timestamps
    end
  end
end
