class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :cover_thumbnail
      t.string :cover_image
      t.string :content_version
      t.string :publisher
      t.string :published_date
      t.text :description
      t.string :categories
      t.string :average_rating
      t.integer :ratings_count

      t.timestamps
    end
  end
end
