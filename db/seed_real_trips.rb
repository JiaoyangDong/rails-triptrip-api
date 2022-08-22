id = 60
user = User.find(id)

Trip.create(
  user: user,
  title: 'Soulscape',
  location: 'Lost Villa, Anji',
  address:  '灵峰街道桃花源悦容商业广场5-5号楼, 安吉, 湖州',
  image: 'https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  start_date: '2022-08-26',
  end_date: '2022-08-29',
  description: 'Yoga teacher Jaime Hepburn typically runs multiple retreats during the year in beautiful destinations. From Aug. 26 to Aug. 29, this retreat in Anji, includes 3 nights at a luxurious villa overlooking the mountains, all meals and snacks, yoga twice a day with Jamie, a cooking course, and more.',
  tags: ['yoga', 'relaxing', 'adventure'],
  status: 'open',
  capacity: 15
)

Trip.create(
  user: user,
  title: 'Rascals on the road - Hiking ',
  location: 'Solvang Village, Moganshan',
  address: "莫干山唯樂山居精品酒店, 德清， 湖州",
  image: 'https://images.unsplash.com/photo-1542696971-bedf437263f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  start_date: '2022-08-26',
  end_date: '2022-08-29',
  description: "Beautiful Ningbo is located three and half hours away from Shanghai city.  Ningbo, located in Zhejiang Province in eastern China on the East China Sea, is one of China’s oldest cities. The city's name translates as “serene waves,” which has a city population of about 2.2 million.We will be staying in a small town called Dayan Town. In where around 15000 people live in this town. The guest house is surrounded by a river and mountains. Good opportunity to disconnect from the city and let your four-legged friend be off the leash and yourself free of stress.",
  tags: ['petfriendly', 'hiking', 'adventure'],
  status: 'open',
  capacity: 10
)

trip = Trip.create(
  user: user,
  title: 'Stand-up paddling near Shanghai',
  location: 'Dianshan Lake',
  address: '淀山湖风景区, 青浦区, 上海',
  image: "https://images.unsplash.com/photo-1530055934217-67ff81dff696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80",
  start_date: '2022-08-13',
  end_date: '2022-08-13',
  description: "Dianshan lake is the premier paddling charter around Shanghai. On this trip you will have unique paddling adventure and include complementary lunch",

  status: 'closed',
  capacity: 12
)

['petfriendly', 'family', 'adventure'].each do |tag|
  trip.tags << Tag.find(name: tag)
end
