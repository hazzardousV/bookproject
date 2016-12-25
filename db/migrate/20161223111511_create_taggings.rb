class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :author, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
