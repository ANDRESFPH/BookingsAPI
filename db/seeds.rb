# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org1 = Organization.create(title: 'compay', description: 'none', org_type: 'type org')
org2 = Organization.create(title: 'compay 2', description: 'none', org_type: 'type org')
org3 = Organization.create(title: 'compay 3', description: 'none', org_type: 'type org')

addr1 = Address.create(street: 'calle 1', city: 'Barcelona', country: 'spain', zip: '0009' )
addr2 = Address.create(street: 'calle 2', city: 'Barcelona', country: 'spain', zip: '0009' )
addr3 = Address.create(street: 'calle 3', city: 'Barcelona', country: 'spain', zip: '0009' )