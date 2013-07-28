class Product < ActiveRecord::Base
  include ProperProductName

  def sale?
    sale_price.present? && sale_price < retail_price
  end

  def lowest_price
    sale_price.present? ? sale_price : retail_price
  end
end
