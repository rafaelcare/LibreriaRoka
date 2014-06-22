class OrderDetail < ActiveRecord::Base
	has_one :product
end
