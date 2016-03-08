json.array!(@headlines) do |headline|
  json.extract! headline, :id, :headline_text, :is_repeat, :is_primary, :has_moved, :response_id
  json.url headline_url(headline, format: :json)
end
