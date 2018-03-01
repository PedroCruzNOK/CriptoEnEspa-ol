class CreateBlogArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :content
      t.string :url
      t.string :source
      t.string :image_url

      t.timestamps
    end
  end
end
