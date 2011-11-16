class Pedido < ActiveRecord::Base
    validates_presence_of :cliente_id, :vendedor, :message => " em branco, preencha corretamente."
    validates_uniqueness_of :npedido, :message => " de peça existente no cadastro para este produto."
    has_many :pprods, :dependent => :destroy
    has_many :produtos, :through => :pprods
    #belongs_to :cliente
    
  def to_param
    "#{id}--#{cliente_id}-#{npedido.parameterize}"
  end
    
end
