module StaticsHelper

  def search_product_name(result)
    brand = result.xpath('Brand_Name').text
    product = result.xpath('Product_Name').text
    if product.downcase.include?(brand.downcase)
      name = product
    else
      name = product.downcase.gsub(brand.downcase, '')
      name = brand + ' ' + name.titleize
    end
  end
end
