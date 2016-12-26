class AddPaperclipFieldToBook < ActiveRecord::Migration
  def change
  	add_column :books, :image_file_name,    :string
    add_column :books, :image_content_type, :string
    add_column :books, :image_file_size,    :integer
    add_column :books, :image_updated_at,   :datetime
    add_column :authors, :image_file_name,    :string
    add_column :authors, :image_content_type, :string
    add_column :authors, :image_file_size,    :integer
    add_column :authors, :image_updated_at,   :datetime
  end
end
