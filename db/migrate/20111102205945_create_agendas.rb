class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.string :retorno
      t.references :cliente

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
