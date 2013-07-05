class AddPicLargeSquareUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pic_large_square_url, :string
  end
end
