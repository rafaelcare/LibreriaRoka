class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :usuario_id
      t.integer :order_id
      t.integer :product_id
      t.float :importetotal
      t.float :preciounitario
      t.integer :cantidad
      t.float :descuento

      t.timestamps
    end
  end
end
