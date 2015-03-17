json.array!(@documents) do |document|
  json.extract! document, :id, :title, :date_validity, :checkout, :notification_period
  json.url document_url(document, format: :json)
end
