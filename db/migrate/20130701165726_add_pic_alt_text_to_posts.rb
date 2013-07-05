class AddPicAltTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :picture_alt_text, :string
  end
end
