json.array!(@responses) do |response|
  json.extract! response, :id, :response_time, :raw_html, :source_id
  json.url response_url(response, format: :json)
end
