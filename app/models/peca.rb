class Peca < ActiveRecord::Base
    validates_presence_of :produto_id, :codigo, :descr, :message => " em branco, preencha corretamente."
    validates_length_of :codigo, :minimum => 3, :message => " requer 3 caracteres ou mais para cadastro."
    validates_uniqueness_of :codigo, :scope => :produto_id, :message => " de peça existente no cadastro para este produto."
    belongs_to :produto
    
  def to_param
    "#{id}--#{codigo.parameterize}-#{descr.parameterize}"
  end
    
end
