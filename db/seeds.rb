#############################################
# reset
#############################################

# Option.destroy_all
# Answer.destroy_all
# TripTag.destroy_all
# Tag.destroy_all
# Question.destroy_all
# Booking.destroy_all
# Bookmark.destroy_all
# Trip.destroy_all
# User.destroy_all

# Tag.create([
#   {
#     name: "oneday",
#     show: "Day trips",
#     icon: "/images/tags/oneday.png",
#     style: ""
#   },
#   {
#     name: "weekend",
#     show: "Weekend",
#     icon: "/images/tags/weekend.png",
#     style: ""
#   },
#   {
#     name: "petfriendly",
#     show: "Pet-friendly",
#     icon: "/images/tags/petfriendly.png",
#     style: ""
#   },
#   {
#     name: "hiking",
#     show: "Hiking",
#     icon: "/images/tags/hiking.png",
#     style: "height:70rpx;width:70rpx;margin-top: 11rpx;"
#   },
#   {
#     name: "relaxing",
#     show: "Relaxing",
#     icon: "/images/tags/relaxing.png",
#     style: "height:65rpx;width:65rpx;margin-top:17rpx;"
#   },
#   {
#     name: "family",
#     show: "Family",
#     icon: "/images/tags/family.png",
#     style: "height:70rpx;width:70rpx;margin-top: 11rpx;"
#   },
#   {
#     name: "adventure",
#     show: "Adventure",
#     icon: "/images/tags/adventure.png",
#     style: "height:70rpx;width:70rpx;margin-top: 11rpx;"
#   },
#   {
#     name: "biking",
#     show: "Biking",
#     icon: "/images/tags/biking.png",
#     style: "height:70rpx;width:70rpx;margin-top: 11rpx;"
#   }
# ])


#############################################
# old faker
#############################################

# trip_url="https://api.unsplash.com/search/photos?page=1&query=group+trip&client_id=Cu-bOxmHNpsY4DftpFskX6nkbRH6JUnUoR9QbYHN2-g"
# trips = JSON.parse(URI.open(trip_url).read)["results"].first(30)

# TITLE = ["Hiking in the mountains", "Yoga & Meditation Retreat", "Camping in the forest", "Memorable journey to local scenic sites", "Rascals on the road - Waterfalls", "Weekend getaway", "Countrywalk for city dwellers", "Weekend in bamboo forest & reservoir", "Stand-up paddling in the lake", "Escape city life - Mindful Retreat" ]
# CITY = ["青浦区淀山湖风景区", "普陀山风景名胜区", "舟山桃花岛风景旅游区", "浦东新区前滩休闲公园(前滩大道北)", "崇明东平国家森林公园", "西湖风景名胜区", "西湖区杭州西溪国家湿地公园东区", "长风公园", "世博公园(北村)", "嵊泗列岛风景名胜区(马前岗隊道东)"]
# STREET = %w[Yanping Wuding Luoshan Aomen]

# TAGS = %w[hiking oneday weekend petfriendly family relaxing adventure biking]

# 10.times do |n|
#   if user = User.create(name: Faker::GreekPhilosophers.name)
#     p "Added new user: #{user.name}"
#     if trip = Trip.create(
#       user: user,
#       title: TITLE.sample,
#       location: CITY.sample,
#       address:  "#{(1..999).to_a.sample} Road #{STREET.sample}",
#       start_date: Faker::Date.between(from: 2.days.ago, to: '2022-09-03'),
#       end_date: Faker::Date.between(from: '2022-09-05', to: '2022-09-07'),
#       description: Faker::Lorem.paragraph(sentence_count: 3),
#       status: %w[open ongoing closed].sample,
#       capacity: [8, 10, 15, 16, 20, 30].sample
#     )
#       file = URI.open(trips[n]["urls"]["small"])
#       trip.image.attach(io: file, filename: "grouptrip#{trip.id}.jpeg")
#       trip.save
#       trip.tags << Tag.all.sample(rand(1..3))
#       p "Added new trip: #{trip.title}"
#     else
#       p "Failed to add new trip: #{trip.title} !!!!!!!"
#     end
#   end
# end

# # Seed Booking
# Trip.all.each do |trip|
#   if b = Booking.create(user: User.all.sample, trip: trip, approved: [true, false].sample)
#     p "add new booking."
#   else
#     p "fail to add new booking"
#   end
# end

# # Seed Bookmarks
# User.all.each do |user|
#   if b = Bookmark.create(user: user, trip: Trip.all.sample)
#     p "add new bookmark."
#   else
#     p "fail to add new bookmark"
#   end
# end



############################################
#  SEED SURVEY
#############################################

# trip_id= 96
# wechat_id=70
# # Seed survey questions
# trip = Trip.find(trip_id)
# trip.questions.destroy_all
# q1 =  Question.create(content: "What room type do you want to live in?")
# q2 =  Question.create(content: "Dietary requirements?")
# q3 =  Question.create(content: "Do you need pick up?")
# trip.questions = [q1,q2,q3]

# A1= ["Private Room","Shared Room","no preference"]
# A2= ["Vegetarian","Vegan","None"]
# A3= ["Yes","No"]

# # options

# # seed survey attendees
# users = User.all.sample(5)
# users << User.find(wechat_id)
# users.each do |user|
#   booking = Booking.create(user: user, trip: trip)
#   # seed survey answers
#   Answer.create(question: q1, booking: booking, content: A1.sample)
#   Answer.create(question: q2, booking: booking, content: A2.sample)
#   Answer.create(question: q3, booking: booking, content: A3.sample)
# end
