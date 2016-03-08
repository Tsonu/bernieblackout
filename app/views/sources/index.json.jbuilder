json.array!(@sources) do |source|
  json.extract! source, :id, :url, :main_header_id, :main_header_class, :sub_header_id, :sub_header_class
  json.url source_url(source, format: :json)
end
