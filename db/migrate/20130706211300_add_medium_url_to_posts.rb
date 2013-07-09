class AddMediumUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pic_medium_url, :string
  end
end
