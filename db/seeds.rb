user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")
