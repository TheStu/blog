class StaticsController < ApplicationController
  def home
    @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def about
  end

  def brands
    @brands = Retailer.all
    @brands = @brands.where('cottage_industry = ?', true) if params[:cottage].present?
    @brands = @brands.joins(:internal_categories).where(internal_categories: {id: params[:gear].to_i}) if params[:gear].present?
    @brands = @brands.sort_by { |b| b.name }
    @created = Retailer.order('created_at ASC').first.created_at
    @updated = Retailer.order('updated_at DESC').first.updated_at
  end

  def results
    if params[:q].present?
      if params[:page].present?
        offset = (params[:page].to_i * 20) - 20
      else
        offset = 0
      end
      url = "http://www.avantlink.com/api.php?affiliate_id=31645&module=ProductSearch&output=xml&website_id=145073&search_term=#{CGI.escape(params[:q])}&search_results_fields=Merchant+Name%7CProduct+Name%7CBrand+Name%7CRetail+Price%7CSale+Price%7CThumbnail+Image%7CBuy+URL%7CPrice+Discount+Percent%7CMatch+Result&search_results_base=#{ offset }&search_results_count=20"

      require 'nokogiri'
      require 'open-uri'

      data = Nokogiri::XML(open(url))
      @results = data.xpath('//Table1')
      if @results.present?
        total_results = @results.first.xpath('Match_Result').text.gsub(/\d+ of /, '').to_i
        @last_page = total_results / 20.to_f == total_results / 20 ? total_results / 20 : total_results / 20 + 1
        @last_page = 10 if @last_page > 10
        @current_page = params[:page].present? ? params[:page].to_i : 1
      end
    end
  end
end
