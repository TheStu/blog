class Retailer < ActiveRecord::Base
  has_many :internal_categorizations, as: :internal_categorizable, dependent: :destroy
  has_many :internal_categories, :through => :internal_categorizations

  validates_presence_of :name, :url
end
