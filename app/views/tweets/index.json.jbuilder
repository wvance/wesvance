json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :body, :user, :image, :location
  json.url tweet_url(tweet, format: :json)
end
