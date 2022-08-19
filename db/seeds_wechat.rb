id = 60 # change to your own wechat user id
# 70 zora 79 local
# 71 annie
# 60 julian

# Seed your own wechat user
trip_url="https://api.unsplash.com/search/photos?page=1&query=group+trip&client_id=Cu-bOxmHNpsY4DftpFskX6nkbRH6JUnUoR9QbYHN2-g"
trips = JSON.parse(URI.open(trip_url).read)["results"].first(10)
TITLE = ["Hiking in the mountains", "Yoga & Meditation Retreat", "Camping in the forest", "Memorable journey to the scenic sites", "Rascals on the road - Waterfalls", "Weekend getaway", "Countrywalk for the city dwellers", "Weekend in bamboo forest & reservoir", "Stand-up paddling in the lake", "Escape the city life - Mindful Retreat" ]
CITY = ["Moganshan", "Anhui", "Anji", "Ningbo", "Chongming", "Moganshan", "Xianju", "Hangzhou", "Anji", "Moganshan"]
STREET = %w[Yanping Wuding Luoshan Aomen]
TAGS = %w[Hiking One-day Weekend Pet-friendly Family Relaxing Adventure Biking]

user = User.find(id)

# Admin
2.times do |n|
  %w[open ongoing].each_with_index do |status, i|
    if trip = Trip.create(
      user: user,
      title: TITLE.sample,
      location: CITY.sample,
      address:  "#{(1..999).to_a.sample} Road #{STREET.sample}",
      # image: trips[i]["urls"]["small"],
      start_date: Faker::Date.between(from: 2.days.ago, to: '2022-09-03'),
      end_date: Faker::Date.between(from: '2022-09-05', to: '2022-09-07'),
      description: Faker::Lorem.paragraph(sentence_count: 3),
      status: status,
      capacity: [8, 10, 15, 16, 20, 30].sample
    )
      file = URI.open(trips[n]["urls"]["small"])
      trip.image.attach(io: file, filename: "grouptrip#{n}.jpeg") #, content_type: 'image/png')
      trip.tags << Tag.all.sample(rand(1..3))
      trip.save
      p "Added new trip for wechat user: #{trip.title}"
    end
  end
end

# Attenddee
5.times do
  # booking
  # if b = Booking.create(user: user, trip: Trip.all.where(status: ongoing).sample)
  #   p "add new booking."
  # else
  #   p "fail to add new booking"
  # end
  # bookmark
  User.all.each do |user|
    if b = Bookmark.create(user: user, trip: Trip.all.sample)
      p "add new bookmark."
    else
      p "fail to add new bookmark"
    end
  end
end
