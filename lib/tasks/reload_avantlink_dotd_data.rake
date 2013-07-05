desc "regets Deal of the Day data from Avantlink for display in sidebar"
task :reload_dotd_data => :environment do

  #run at 5am MST

  require 'nokogiri'
  require 'open-uri'

  datafeed_urls = ['http://www.avantlink.com/api.php?affiliate_id=31645&module=DotdFeed&output=xml&website_id=41369&merchant_id=10060&dotd_id=6', #Backcountry
                   'http://www.avantlink.com/api.php?affiliate_id=31645&module=DotdFeed&output=xml&website_id=41369&merchant_id=10248&dotd_id=16', #REI
                   'http://www.avantlink.com/api.php?affiliate_id=31645&module=DotdFeed&output=xml&website_id=41369&merchant_id=11501&dotd_id=293'] #GoLite

  Dotd.destroy_all

  datafeed_urls.each do |url|
    data = Nokogiri::XML(open(url))

    entry = Dotd.new(product_name: data.xpath('//Product_Name').text,
                     brand: data.xpath('//Brand').text,
                     retail_price: data.xpath('//Retail_Price').text,
                     sale_price: data.xpath('//Sale_Price').text,
                     small_image_url: data.xpath('//Small_Image_URL').text,
                     buy_url: data.xpath('//Buy_URL').text,
                     percent_off: data.xpath('//Percent_Off').text,
                     price_difference: data.xpath('//Price_Difference').text,
                     merchant_name: data.xpath('//Merchant_Name').text)
    entry.save
  end

end
