class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :rfc
      t.string :nombre
      t.string :apellidos
      t.string :telefono
      t.string :direccion
      t.string :facebook
      t.string :lynkedin
      t.string :email

      t.timestamps
    end
  end
end
