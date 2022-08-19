# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Answer.destroy_all
Question.destroy_all
Booking.destroy_all
Bookmark.destroy_all
Trip.destroy_all
User.destroy_all

# admin = User.create(name: "John Doe", image: "https://res.cloudinary.com/wagon/image/upload/v1/cache/41c0e9dcfa12f55daefaff6bf18d4b28.png", phone: "15618653272")
# attendee = User.create(name: "Alex", image: "https://res.cloudinary.com/wagon/image/upload/v1/cache/41c0e9dcfa12f55daefaff6bf18d4b28.png", phone: "000000")
# Trip.create(title: "Batch #891 graduation party", location: "Moganshan Naked Castle", image: "https://cdn-assets.nakedretreats.cn/naked-castle/assets/image/home/banner1.jpg", start_date: "2022-08-20", end_date: "2022-08-27", description: "This is a graduation party for batch #891", status: "open", capacity: 20, user_id: 1
# Booking.create(trip: Trip.last, user: attendee, approved: true)
# Booking.create(trip: Trip.last, user: User.last, approved: true)


trip_url="https://api.unsplash.com/search/photos?page=1&query=group+trip&client_id=Cu-bOxmHNpsY4DftpFskX6nkbRH6JUnUoR9QbYHN2-g"
trips = JSON.parse(URI.open(trip_url).read)["results"].first(30)

## TRIP
TITLE = ["Hiking in the mountains", "Yoga & Meditation Retreat", "Camping in the forest", "Memorable journey to local scenic sites", "Rascals on the road - Waterfalls", "Weekend getaway", "Countrywalk for city dwellers", "Weekend in bamboo forest & reservoir", "Stand-up paddling in the lake", "Escape city life - Mindful Retreat" ]
CITY = ["青浦区淀山湖风景区", "普陀山风景名胜区", "舟山桃花岛风景旅游区", "浦东新区前滩休闲公园(前滩大道北)", "崇明东平国家森林公园", "西湖风景名胜区", "西湖区杭州西溪国家湿地公园东区", "长风公园", "世博公园(北村)", "嵊泗列岛风景名胜区(马前岗隊道东)"]
STREET = %w[Yanping Wuding Luoshan Aomen]

TAGS = %w[hiking oneday weekend petfriendly family relaxing adventure biking]

# Seed tags
TAGS.each do |tag|
  Tag.create(name: tag)
end

# seed User & Trip
10.times do |n|
  if user = User.create(name: Faker::GreekPhilosophers.name)
    p "Added new user: #{user.name}"
    if trip = Trip.create(
      user: user,
      title: TITLE.sample,
      location: CITY.sample,
      address:  "#{(1..999).to_a.sample} Road #{STREET.sample}",
      # image: trips[n]["urls"]["small"],
      start_date: Faker::Date.between(from: 2.days.ago, to: '2022-09-03'),
      end_date: Faker::Date.between(from: '2022-09-05', to: '2022-09-07'),
      description: Faker::Lorem.paragraph(sentence_count: 3),
      status: %w[open ongoing closed].sample,
      capacity: [8, 10, 15, 16, 20, 30].sample
    )
      file = URI.open(trips[n]["urls"]["small"])
      trip.image.attach(io: file, filename: "grouptrip#{trip.id}.jpeg") #, content_type: 'image/png')
      trip.save
      trip.tags << Tag.all.sample(rand(1..3))
      p "Added new trip: #{trip.title}"
    else
      p "Failed to add new trip: #{trip.title} !!!!!!!"
    end
  end
end

# Seed Booking
Trip.all.each do |trip|
  if b = Booking.create(user: User.all.sample, trip: trip, approved: [true, false].sample)
    p "add new booking."
  else
    p "fail to add new booking"
  end
end

# Seed Bookmarks
User.all.each do |user|
  if b = Bookmark.create(user: user, trip: Trip.all.sample)
    p "add new bookmark."
  else
    p "fail to add new bookmark"
  end
end
