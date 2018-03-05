class CreatePrivacyPolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :privacy_policies do |t|
      t.text :content
      t.string :version

      t.timestamps
    end
  end
end
