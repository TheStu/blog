desc "regets ads from Avantlink for display beside logo once a week"
task :reload_ads => :environment do

  if Time.now.wday == 1

    #run at 6am MST

    require 'nokogiri'
    require 'open-uri'

    get_ad_urls = ['http://www.avantlink.com/api.php?affiliate_id=31645&module=AdSearch&output=xml&website_id=145073&merchant_id=10060&ad_type=image&image_height=60&image_width=468&search_results_count=2&search_results_sort_order=Ad+Last+Modified+Date%7Cdesc&integration_type=standard', #Backcountry
                   'http://www.avantlink.com/api.php?affiliate_id=31645&module=AdSearch&output=xml&website_id=145073&merchant_id=10248&ad_type=image&image_height=60&image_width=468&search_results_count=2&search_results_sort_order=Ad+Last+Modified+Date%7Cdesc&integration_type=standard', #REI
                   'http://www.avantlink.com/api.php?affiliate_id=31645&module=AdSearch&output=xml&website_id=145073&merchant_id=10008&ad_type=image&image_height=60&image_width=468&search_results_count=2&search_results_sort_order=Ad+Last+Modified+Date%7Cdesc&integration_type=standard', #Campsaver
                   'http://www.avantlink.com/api.php?affiliate_id=31645&module=AdSearch&output=xml&website_id=145073&merchant_id=11501&ad_type=image&image_height=60&image_width=468&search_results_count=2&search_results_sort_order=Ad+Last+Modified+Date%7Cdesc&integration_type=standard'] #GoLite

    Ad.destroy_all

    get_ad_urls.each do |url|
      data = Nokogiri::XML(open(url))
      data.xpath('//Table1').each do |ad|

        entry = Ad.new(ad_content:    ad.xpath('Ad_Content').text,
                       ad_url:        ad.xpath('Ad_Url').text,
                       merchant_name: ad.xpath('Merchant_Name').text)
        entry.save
      end
    end
  end
end
