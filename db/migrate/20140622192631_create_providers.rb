class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :empresa
      t.string :nombre
      t.string :telefono
      t.string :direccion
      t.string :email

      t.timestamps
    end
  end
end
