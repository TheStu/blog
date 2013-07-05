class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_description, :string
    add_column :posts, :section, :string
    add_index :posts, :section
  end
end
