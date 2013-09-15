class GearGuide < ActiveRecord::Base
  belongs_to :user
  has_many :internal_categorizations, as: :internal_categorizable, dependent: :destroy
  has_many :internal_categories, :through => :internal_categorizations

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
