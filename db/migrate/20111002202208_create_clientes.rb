class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :operadora,  :limit => 10
      t.string :fone,       :limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
