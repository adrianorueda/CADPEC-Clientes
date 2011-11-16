class LineItem < ActiveRecord::Base
  belongs_to :produto
  belongs_to :order
end
