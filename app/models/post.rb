class Post < ActiveRecord::Base

  include GetFlickr
  include UpdateReviewProducts

  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :citations, dependent: :destroy

  accepts_nested_attributes_for :citations, :reject_if => lambda { |a| a[:url].blank? or a[:text].blank? }, :allow_destroy => true

  after_save :update_flickr_urls
  after_save :update_review_products

  validates_presence_of :title, :content, :flickr_url, :picture_alt_text, :section,
  :meta_description, :user_id, :categories

  include Tire::Model::Search
  include Tire::Model::Callbacks

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
    Post.includes(:categorizations).where(["categorizations.category_id IN (?) AND categorizations.post_id != ?", categories, self.id]).references(:categorizations)
  end

  def content_with_review_ads
    if self.is_a_review?

      content_with_ads = content
      products = Product.order('sale_price DESC').where("post_id = ?", self.id)
      (3 - products.length).times { |a| products << nil } # so that the products array is always 3 entries long

      products.each_with_index do |product, i|
        unless product == nil
          content_with_ads = content_with_ads.gsub("<p>[[ad##{i + 1}]]</p>",
                                "
                                  <div class=\"review-ad\">
                                    <a href=\"#{product.buy_url}\" target=\"_blank\" rel=\"nofollow\">
                                      <span class=\"review-ad-merch\">#{product.merchant_name.gsub('.com', '')}</span>
                                      <span class=\"review-ad-name\">#{product.proper_product_name}</span>
                                      <span class=\"review-ad-price #{product.sale? ? 'review-ad-sale' : ''}\">#{product.lowest_price}</span>
                                    </a>
                                  </div>
                                ")
        else
          content_with_ads = content_with_ads.gsub("<p>[[ad##{i + 1}]]</p>", "")
        end
      end
      return content_with_ads
    else
      content
    end
  end
end
