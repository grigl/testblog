json.array!(@posts) do |post|
  json.extract! post, :id, :title, :author, :author_ip, :post_body
  json.url post_url(post, format: :json)
end
