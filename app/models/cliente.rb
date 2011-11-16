class Cliente < ActiveRecord::Base
    validates_presence_of :nome, :endereco, :message => " em branco, preencha corretamente."
    validates_length_of :nome, :minimum => 2, :message => " requer 2 caracteres ou mais para cadastro."
    has_many :pedidos, :dependent => :destroy
    #belongs_to :pedido, :foreign_key => :cliente_id, :class_name => "Pedido" #quero mostrar o nome do cliente em pedidos
    has_many :historicos
    has_many :agendas
    
  def to_param
    "#{id}-#{nome.parameterize}"
  end
    
end
