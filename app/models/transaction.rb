class Transaction < ActiveRecord::Base
	validates :product_req_id, presence: true
	validates :product_offered_id, presence: true
end
