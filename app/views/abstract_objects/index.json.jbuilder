json.array!(@abstract_objects) do |abstract_object|
  json.extract! abstract_object, :id
  json.url abstract_object_url(abstract_object, format: :json)
end
