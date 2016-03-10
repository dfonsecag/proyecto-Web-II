json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :product_req_id, :product_offered_id
  json.url transaction_url(transaction, format: :json)
end
