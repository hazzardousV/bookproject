class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :title
      t.string :link

      t.timestamps null: false
    end
  end
end
