class RenameColumnDecriptionInCons < ActiveRecord::Migration[7.1]
  def change
    rename_column :cons, :decription, :description
  end
end
