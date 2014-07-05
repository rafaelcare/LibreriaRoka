class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :usuario_id
      t.integer :client_id
      t.text :descripcion
      t.text :acuerdo
      t.string :medio

      t.timestamps
    end
  end
end
