module UpdateReviewProducts

  require 'open-uri'
  require 'nokogiri'

  def update_review_products
    if last_updated_products_for_review.blank? or last_updated_products_for_review < Time.now - 1.week
      Product.where("post_id = ?", id).destroy_all

      found = []

      url = "http://www.avantlink.com/api.php?affiliate_id=31645&module=ProductSearch&output=xml&website_id=41369&search_term=#{CGI.escape(title.gsub(' Review', ''))}&search_advanced_syntax=0&search_results_fields=Merchant+Name%7CProduct+Name%7CBrand+Name%7CRetail+Price%7CSale+Price%7CBuy+URL%7CMerchant+Id&search_results_merchant_limit=1&search_results_options=precise"
      results = Nokogiri::XML(open(url))

      found = preferred_first(results)
      results.xpath("/NewDataSet/Table1").first(3 - found.count).each { |a| found << a }

      save_results(found)

      self.last_updated_products_for_review = Time.now
      self.save

    end
  end

  def preferred_first(results)
    found = []

    ['10060', '10248', '10008', '10032'].each do |preferred_merch| # Backcountry, REI, Campsaver, Altrec, respectively
      if results.xpath("/NewDataSet/Table1[Merchant_Id/text()='#{preferred_merch}']").present?
        found << results.xpath("/NewDataSet/Table1[Merchant_Id/text()='#{preferred_merch}']")
      end
    end
    return found
  end

  def save_results(results)
    results.each do |result|
      product = Product.new(post_id:       id,
                            merchant_name: result.xpath('Merchant_Name').text,
                            product_name:  result.xpath('Product_Name').text,
                            brand:         result.xpath('Brand_Name').text,
                            retail_price:  result.xpath('Retail_Price').text,
                            sale_price:    result.xpath('Sale_Price').text,
                            buy_url:       result.xpath('Buy_URL').text)
      product.save
    end
  end
end
