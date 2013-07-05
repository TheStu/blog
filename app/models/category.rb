class Category < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :posts, through: :categorizations

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
