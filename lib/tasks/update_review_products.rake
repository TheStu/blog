desc "update the product ads for the reviews once a week"
task :update_review_products_task => :environment do
  if Time.now.wday == 6
    include UpdateReviewProducts
    Post.where("is_a_review = ?", true).each do |post|
      post.update_review_products
    end
  end
end
