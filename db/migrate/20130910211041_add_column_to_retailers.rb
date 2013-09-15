class AddColumnToRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :avantlink_searchable, :boolean
  end
end
