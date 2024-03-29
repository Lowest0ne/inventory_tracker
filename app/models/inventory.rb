class Inventory < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than: 0
end
