class AddPriceToPins < ActiveRecord::Migration
  def change
    add_column :pins, :price, :string
  end
end
