class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :summary
      t.text :content
      t.string :url
      t.timestamp :published
      t.string :categories
      t.string :image_urls
      t.string :entry_id

      t.timestamps
    end
  end
end
