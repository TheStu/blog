class AddReviewDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :stars, :decimal
    add_column :posts, :last_updated_products_for_review, :timestamp
    add_column :posts, :is_a_review, :boolean, default: false
  end
end
