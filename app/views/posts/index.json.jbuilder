json.array!(@posts) do |post|
  json.extract! post, :id, :title, :author, :author_ip, :post
  json.url post_url(post, format: :json)
end
