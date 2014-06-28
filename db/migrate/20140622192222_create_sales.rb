class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :usuario_id
      t.datetime :fecha
      t.integer :client_id
      t.float :importetotal

      t.timestamps
    end
  end
end
