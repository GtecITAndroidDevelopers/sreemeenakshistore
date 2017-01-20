class AddExtraToProducts < ActiveRecord::Migration
  def change
    add_column :products, :url, :string
    add_column :products, :category, :string
    add_column :products, :status, :string
  end
end
