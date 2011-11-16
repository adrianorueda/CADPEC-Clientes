require 'paperclip'
class Produto < ActiveRecord::Base
  validates_presence_of :descr, :message => " em branco, preencha corretamente."
  validates_uniqueness_of :codigo, :message => " de peça existente no cadastro para este produto."
  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>", :original => "800x600>" }
  has_many :components
  has_many :pecas, :dependent => :destroy
  has_many :pedidos, :through => :pprods
  belongs_to :pprod
  
  def to_param
    "#{id}-#{descr.parameterize}"
  end
  
end