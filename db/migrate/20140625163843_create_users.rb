class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellidos
      t.string :telefono
      t.string :direccion
      t.string :email
      t.string :rolusuario
      t.string :contrasena

      t.timestamps
    end
  end
end
