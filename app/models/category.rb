class Category < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :posts, through: :categorizations

  validates_presence_of :name

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
