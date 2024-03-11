class CreateCons < ActiveRecord::Migration[7.1]
  def change
    create_table :cons do |t|
      t.string :name
      t.text :decription
      t.integer :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
