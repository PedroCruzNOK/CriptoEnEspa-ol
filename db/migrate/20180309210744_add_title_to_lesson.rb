class AddTitleToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :title, :string
  end
end
