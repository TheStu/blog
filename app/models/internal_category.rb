class InternalCategory < ActiveRecord::Base
  has_many :internal_categorizations, dependent: :destroy
  has_many :retailers, through: :internal_categorizations, source: :internal_categorizable, source_type: 'Retailer'
  has_many :gear_guides, through: :internal_categorizations, source: :internal_categorizable, source_type: 'GearGuide'

  validates_presence_of :name
end
