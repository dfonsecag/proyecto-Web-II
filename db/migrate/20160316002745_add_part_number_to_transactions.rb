class AddPartNumberToTransactions < ActiveRecord::Migration
  def change
  	add_foreign_key :transactions, :products, column: :product_req_id
  	add_foreign_key :transactions, :products, column: :product_offered_id
  end
end
