class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :category

  after_save :update_category_tagged_count
  after_destroy :update_category_tagged_count

  private

    def update_category_tagged_count
      self.category.update_attributes(tagged_posts: Categorization.where("category_id = ?", self.category.id).count)
    end
end
