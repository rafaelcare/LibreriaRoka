class CreateSaleDetails < ActiveRecord::Migration
  def change
    create_table :sale_details do |t|
      t.integer :sale_id
      t.integer :product_id
      t.float :importetotal
      t.float :preciounitario
      t.integer :cantidad
      t.float :descuento

      t.timestamps
    end
  end
end
