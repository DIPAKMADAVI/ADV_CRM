# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create!([{role_name: 'Super admin'},{role_name: 'Admin'}, {role_name: 'Supervisor'}, {role_name: 'Agent'}])

User.create!(email: 'dipakmadavi@gmail.com', password: 'dipakmadavi', role_id: Role.find_by_role_name('Super admin').id, username: 'superadmin', firstname: 'admin', lastname: 'user', phone_no: '1234567890', department_id:2 )
