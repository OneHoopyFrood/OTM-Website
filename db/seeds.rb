User.create!(fname: "Cole",
             lname: "Panike",
             email: "colepanike@gmail.com"
             password: "superadmin",
             password_confirmation: "superadmin",
             admin: true )

12.times do |n|
  fname  = Faker::Name.first_name
  lname = Faker::Name.last_name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(fname:  fname,
               lname: lname,
               email: email,
               password:              password,
               password_confirmation: password)
end

25.times do |n|
  title = Faker::App.Name
  body = Faker::Lorem.paragraph(4)
  user = User.order("RANDOM()").first

  Post.create!(
    title: title,
    body: body,
    user: user )
end