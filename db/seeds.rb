# Engineer: read,create User and Book
# Planner: read,create User and read Book
# QA: read Book
# All company member: read Book

User.create!(id: 1, name: 'A', email: 'AAA@gmail.com', password: '12345678')
User.create!(id: 2, name: 'B', email: 'BBB@gmail.com', password: '12345678')
User.create!(id: 3, name: 'C', email: 'CCC@gmail.com', password: '12345678')

Book.create!(user_id: 1, name: 'A book')
Book.create!(user_id: 2, name: 'B book')

ApplicationResource.create!(id: 1, name: 'Book', actions: 'read,create')
ApplicationResource.create!(id: 2, name: 'User', actions: 'read,create')

['Engineer', 'Planner', 'QA'].each_with_index do |name, i|
  Team.create!(id: i + 1, name: name)
end

(1..3).each do |i|
  UserTeam.create!(user_id: i, team_id: i)
end

write_book_permission = Permission.create!(name: 'Book Writable', application_resource_id: 1, allowed_action_names: ['read', 'create'])
read_book_permission = Permission.create!(name: 'Book Readable', application_resource_id: 1, allowed_action_names: ['read'])
manage_user_permission = Permission.create!(name: 'User Manageable', application_resource_id: 2, allowed_action_names: ['read', 'create'])

all_comapany_group = PermissionGroup.create!(name: 'All company member')
manage_group = PermissionGroup.create!(name: 'Manage User and Book group')
manage_user_group = PermissionGroup.create!(name: 'Manage User group')

PermissionGroupReference.create!(permission_group_id: all_comapany_group.id, permission_id: read_book_permission.id)
PermissionGroupReference.create!(permission_group_id: manage_group.id, permission_id: manage_user_permission.id)
PermissionGroupReference.create!(permission_group_id: manage_group.id, permission_id: write_book_permission.id)

PermissionGroupTeam.create!(team_id: 1, permission_group_id: manage_group.id)
PermissionGroupTeam.create!(team_id: 1, permission_group_id: all_comapany_group.id)
PermissionGroupTeam.create!(team_id: 2, permission_group_id: manage_user_group.id)
PermissionGroupTeam.create!(team_id: 2, permission_group_id: all_comapany_group.id)
PermissionGroupTeam.create!(team_id: 3, permission_group_id: all_comapany_group.id)
