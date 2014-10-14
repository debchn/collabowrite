class CreatePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.integer :user_id
      t.integer :prompt_id
      t.text :text
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
  end
end
