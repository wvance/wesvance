json.array!(@contents) do |content|
  json.extract! content, :id, :title, :author, :body, :external_id, :location, :address, :city, :state, :country, :postal, :ip, :latitude, :longitude, :is_active, :image, :external_link, :kind, :has_comments, :rating
  json.url content_url(content, format: :json)
end
