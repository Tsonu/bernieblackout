json.array!(@logs) do |log|
  json.extract! log, :id, :timestamp, :code, :message
  json.url log_url(log, format: :json)
end
