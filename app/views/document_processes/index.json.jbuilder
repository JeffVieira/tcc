json.array!(@process) do |process|
  json.extract! process, :id, :string
  json.url process_url(process, format: :json)
end
