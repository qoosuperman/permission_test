# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

UserGroup.create(id: 1, name: 'Admin', admin: true)
UserGroup.create(id: 2, name: 'Write', admin: false)
UserGroup.create(id: 3, name: 'Read', admin: false)

User.create(id: 1, name: 'A', email: 'AAA@gmail.com', password: '12345678', user_group: UserGroup.find(1))
User.create(id: 2, name: 'B', email: 'BBB@gmail.com', password: '12345678', user_group: UserGroup.find(2))
User.create(id: 3, name: 'C', email: 'CCC@gmail.com', password: '12345678', user_group: UserGroup.find(3))

Book.create(user_id: 1, name: 'A book')
Book.create(user_id: 2, name: 'B book')

PermissionResource.create(name: 'book', default_priority: 'disable')

# write_group
write_group = UserGroup.find(2)
write_group.group_permissions.first.priority = 'writable'
write_group.save

# read_group
read_group = UserGroup.find(3)
read_group.group_permissions.first.priority = 'readable'
read_group.save