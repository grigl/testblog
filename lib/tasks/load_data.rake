namespace :load_data do
  task :categories, [:qnt] => :environment do |t, args|
    qnt = args[:qnt].to_i
    qnt.times do
      category = Category.create(name: Faker::Lorem.word)
    end
  end

  task :posts, [:qnt] => :environment do |t, args|
    qnt = args[:qnt].to_i
    qnt.times do |count|
      category = Category.order("RANDOM()").first
      post = Post.create(category: category,
                         title: Faker::Lorem.sentence(5),
                         author: Faker::Name.name,
                         author_ip: Faker::Internet.ip_v4_address,
                         post_body: Faker::Lorem.sentence(25))
      puts "#{count}"
    end
  end

  task :comments, [:qnt] => :environment do |t, args|
    qnt = args[:qnt].to_i/5
    posts = Post.order('rating desc').order('created_at desc').limit(200)
    authors = Post.limit(100).pluck(:author)
    qnt.times do 
      post = posts.order("RANDOM()").first
      5.times do
        Comment.create(post: post,
                       post_rating: [nil, 1, 2, 3, 4, 5].sample,
                       author: [authors, [Faker::Name.name]].sample.sample,
                       comment_body: Faker::Lorem.sentence(10))
      end
    end
  end
end
