users = (1..10).to_a.map do | i|
    User.create({
        email: "test#{i}@email.com",
        password: "123456",
        password_confirmation: "123456"
    })
end