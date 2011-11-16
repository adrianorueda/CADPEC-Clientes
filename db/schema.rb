# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111110002946) do

  create_table "agendas", :force => true do |t|
    t.string   "retorno"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "operadora",  :limit => 10
    t.string   "fone",       :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historicos", :force => true do |t|
    t.text     "observ"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer "order_id"
    t.integer "produto_id"
    t.integer "qtde"
  end

  create_table "orders", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "operadora",  :limit => 10
    t.string   "fone",       :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pecas", :force => true do |t|
    t.integer  "produto_id"
    t.string   "codigo"
    t.string   "descr"
    t.string   "larg"
    t.string   "alt"
    t.string   "prof"
    t.float    "qtde"
    t.string   "acab"
    t.decimal  "total",      :precision => 10, :scale => 2
    t.decimal  "custo",      :precision => 10, :scale => 2
    t.string   "fita"
    t.string   "pino"
    t.string   "embal"
    t.string   "mdf"
    t.string   "mdf2"
    t.string   "ferr"
    t.string   "ferr2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pecas_produtos", :id => false, :force => true do |t|
    t.integer "peca_id"
    t.integer "produto_id"
    t.string  "id2"
  end

  create_table "pedidos", :force => true do |t|
    t.integer  "cliente_id"
    t.string   "npedido"
    t.decimal  "valor",                    :precision => 10, :scale => 2
    t.string   "vendedor",   :limit => 50
    t.string   "loja",       :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pprods", :force => true do |t|
    t.float    "qtde"
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.integer  "codigoid",                                         :null => false
    t.string   "codigo"
    t.string   "descr"
    t.string   "larg"
    t.string   "alt"
    t.string   "prof"
    t.float    "qtde"
    t.decimal  "preco",             :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
  end

  create_table "vendedors", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
