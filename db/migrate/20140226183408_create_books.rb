class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author
      t.string :coverThumb
      t.string :coverMedium
      t.string :publisher
      t.date :publishedDate
      t.text :description

      t.timestamps
    end
  end
end
