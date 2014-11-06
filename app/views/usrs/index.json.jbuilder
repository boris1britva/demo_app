json.array!(@usrs) do |usr|
  json.extract! usr, :name, :email
  json.url usr_url(usr, format: :json)
end