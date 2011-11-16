class Pprod < ActiveRecord::Base
  validates_presence_of :produto_id, :message => " em branco, preencha corretamente."
  belongs_to :produto
  belongs_to :pedido
end
