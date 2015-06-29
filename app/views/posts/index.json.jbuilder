json.array!(@posts) do |post|
  json.extract! post, :id, :title, :author, :body, :is_active, :date, :time, :is_comments, :rating
  json.url post_url(post, format: :json)
end
