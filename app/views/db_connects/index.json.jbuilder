json.array!(@db_connects) do |db_connect|
  json.extract! db_connect, :id, :data_base, :username, :password
  json.url db_connect_url(db_connect, format: :json)
end
