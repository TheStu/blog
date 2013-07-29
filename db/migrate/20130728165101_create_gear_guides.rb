class CreateGearGuides < ActiveRecord::Migration
  def change
    create_table :gear_guides do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :meta_description

      t.timestamps
    end
  end
end
