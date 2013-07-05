class AddToPostTable < ActiveRecord::Migration
  def change
    add_column :posts, :pic_thumbnail_url, :string
    add_column :posts, :pic_large_url, :string
    add_column :posts, :flickr_url, :string
    add_column :posts, :all_time_view_count, :integer, default: 0
    add_column :posts, :monthly_view_count, :integer, default: 0
    add_index :posts, [:all_time_view_count, :monthly_view_count]
  end
end
