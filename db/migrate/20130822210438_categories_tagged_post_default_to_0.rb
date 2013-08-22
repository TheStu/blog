class CategoriesTaggedPostDefaultTo0 < ActiveRecord::Migration
  def change
    change_column :categories, :tagged_posts, :integer, default: 0
  end
end
