# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create! id: 1, name: "Иванов Иван Иванович", email: "user@test.ru", password: "qw", password_confirmation: "qw"

Type.delete_all
Type.create! id: 1, name: "Чай"
Type.create! id: 2, name: "Кофе"

Variety.delete_all
Variety.create! id: 1, name: "Крупнолистовой", type_id: 1
Variety.create! id: 2, name: "Мелколистовой", type_id: 1
Variety.create! id: 3, name: "Молотой", type_id: 2
Variety.create! id: 4, name: "В зернах", type_id: 2

Product.delete_all
Product.create! id: 1, name: "Барито", variety_id: 1, price: 23, active: true
Product.create! id: 2, name: "Байрон", variety_id: 1, price: 21, active: true
Product.create! id: 3, name: "Гранулированный", variety_id: 2, price: 34, active: true
Product.create! id: 4, name: "Кирпичный", variety_id: 2, price: 123, active: true
Product.create! id: 5, name: "Осыы", variety_id: 3, price: 67, active: true
Product.create! id: 6, name: "Фоссы", variety_id: 3, price: 37, active: true
Product.create! id: 7, name: "Жакко", variety_id: 4, price: 84, active: true
Product.create! id: 8, name: "Арго", variety_id: 4, price: 12, active: true
Product.create! id: 9, name: "Угрон", variety_id: 4, price: 22, active: true
Product.create! id: 10, name: "Выгранурат", variety_id: 4, price: 81, active: true
Product.create! id: 11, name: "Вхулот", variety_id: 4, price: 33, active: false

Discount.delete_all
Discount.create! id: 1, name: "1", date_start: "15.06.2015", date_end: "27.06.2015", amount: 2, discount: 25, percent: 1, specification: 0, type_id: 1, variety_id: 2, product_id: 4
Discount.create! id: 2, name: "2", date_start: "20.06.2015", date_end: "25.06.2015", amount: 2, discount: 50, percent: 0, specification: 1, type_id: 1, variety_id: 2, product_id: 4

