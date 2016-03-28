user = User.create!( name:  "Example User",
              email: "foo@bar.com",
              password:              "password",
              password_confirmation: "password")

user.projects.create!( title: "RubyGarage assigments" )
user.projects.create!( title: "For Home" )

user.projects.first.tasks.create!( user_id: user.id,
                                   content: "Clean the rooom" )
user.projects.first.tasks.create!( user_id: user.id,
                                   content: "Buy a milk" )
user.projects.first.tasks.create!( user_id: user.id,
                                   content: "Call Mam" )