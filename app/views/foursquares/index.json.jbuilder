json.array!(@foursquares) do |foursquare|
  json.extract! foursquare, :id, :body, :user, :image, :location, :post_id, :url, :date, :latitude, :longitude
  json.url foursquare_url(foursquare, format: :json)
end
