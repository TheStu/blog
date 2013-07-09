class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :category

  validates_presence_of :category_id, :post_id
end
