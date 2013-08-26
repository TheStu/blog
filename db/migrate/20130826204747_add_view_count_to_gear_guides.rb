class AddViewCountToGearGuides < ActiveRecord::Migration
  def change
    add_column :gear_guides, :view_count, :integer, default: 0
  end
end
