class InternalCategorization < ActiveRecord::Base
  belongs_to :internal_categorizable, polymorphic: true
  belongs_to :internal_category
end
