# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.delete_all    
Band.reset_pk_sequence

User.delete_all    
User.reset_pk_sequence

band1=Band.create!(name:"Beatles")
band2=Band.create!(name:"Cold Play")
band3=Band.create!(name:"21 guns")
band4=Band.create!(name:"Lincoln Park")
band5=Band.create!(name:"Imagine Dragon")

user1=User.create!(email:"linshen@gmail.com", password:"123")
user2=User.create!(email:"hahaha@gmail.com", password:"123")
user3=User.create!(email:"lollol@gmail.com", password:"123")
