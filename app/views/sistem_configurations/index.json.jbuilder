json.array!(@sistem_configurations) do |sistem_configuration|
  json.extract! sistem_configuration, :id, :notification_period
  json.url sistem_configuration_url(sistem_configuration, format: :json)
end
