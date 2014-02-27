json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :author_ip, :comment, :post_rating
  json.url comment_url(comment, format: :json)
end
