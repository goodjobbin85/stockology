class LineItem < ApplicationRecord
  belongs_to :stock
  belongs_to :cart
end
