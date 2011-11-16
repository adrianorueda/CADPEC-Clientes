class CreateHistoricos < ActiveRecord::Migration
  def self.up
    create_table :historicos do |t|
      t.text :observ
      t.references :cliente

      t.timestamps
    end
  end

  def self.down
    drop_table :historicos
  end
end
