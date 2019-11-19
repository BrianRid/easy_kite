class AddAddressToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :address, :string
    add_column :products, :city, :string
    add_column :products, :country, :string
  end
end
