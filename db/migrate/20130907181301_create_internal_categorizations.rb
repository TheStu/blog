class CreateInternalCategorizations < ActiveRecord::Migration
  def change
    create_table :internal_categorizations do |t|
      t.string :internal_categorizable_type
      t.integer :internal_categorizable_id
      t.integer :internal_category_id

      t.timestamps
    end
    add_index :internal_categorizations, :internal_categorizable_type
    add_index :internal_categorizations, :internal_categorizable_id
    add_index :internal_categorizations, :internal_category_id
  end
end
