# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Hotel.create({
  :name       => 'The Lime Boutique Suites',
  :description => 'Good location and new hotel at The Lime Boutique Suites',
  :rooms      => 10,
})

Hotel.create({
  :name       => 'The Park Hyderabad',
  :description => 'Serves the purpose at The Park Hyderabad',
  :rooms      => 15,
})


Hotel.create({
  :name       => 'Novotel Hyderabad Airport',
  :description => 'Worth the money, time and praise at Novotel Hyderabad Airport',
  :rooms      => 20,
})

Hotel.create({
  :name      => 'Holiday Inn Express',
  :description => 'Worth the money, time and praise at Holiday Inn Express',
  :rooms      => 20,
})



