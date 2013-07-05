class Post < ActiveRecord::Base

  include GetFlickr

  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :citations

  after_save :update_flickr_urls
  after_save :update_category_tagged_count
  after_destroy :update_category_tagged_count

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def related
    self.find_by_categories do |posts|
      posts.sort_by do |p|
        matched_categories = p.categories.find_all {|t| self.categories.include?(t)}
        matched_categories.size
      end.reverse
    end
  end

  def find_by_categories
    tag_ids = self.categories.collect{|a| a.id}
    Post.includes(:categorizations).where(["categorizations.category_id IN (?) AND categorizations.post_id != ?", categories, self.id])
  end

  private

    def update_category_tagged_count
      self.categories.each do |cat|
        cat.update_attributes(tagged_posts: Categorization.where("category_id = ?", cat.id).count)
      end
    end
end
