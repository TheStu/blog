module ProperProductName

  def proper_product_name
    if self.product_name.downcase.include?(self.brand.downcase)
      name = self.product_name
    else
      name = self.product_name.downcase.gsub(self.brand.downcase, '')
      name = self.brand + ' ' + name.titleize
    end
  end

end
