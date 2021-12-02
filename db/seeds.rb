# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gob = User.new
gob.name = 'Gob'
gob.email = 'gob@lorb.org'
gob.location = 'New York, NY'
gob.password = '5fjOcAmBxIkdGHP49hZN'
gob.password_confirmation = '5fjOcAmBxIkdGHP49hZN'
gob.save!

crab = User.new
crab.name = 'Crab'
crab.email = 'crab@shack.net'
crab.location = 'Seattle, WA'
crab.password = 'YUaUm7YpmlhFzL3IGOn0' 
crab.password_confirmation = 'YUaUm7YpmlhFzL3IGOn0' 
crab.save!

mud = User.new
mud.name = 'Mudflap'
mud.email = 'mud@flap.edu'
mud.location = 'Burlington, VT'
mud.password = 'zZJ9lYXhM3G5SiykZJPO'
mud.password_confirmation = 'zZJ9lYXhM3G5SiykZJPO'
mud.save!

mike = User.new
mike.name = 'Mike'
mike.email = 'mike@j.gov'
mike.location = 'Washington, DC'
mike.password = 'ygcwc98QWnkBKnUIkyQI'
mike.password_confirmation = 'ygcwc98QWnkBKnUIkyQI'
mike.save!
