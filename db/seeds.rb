users = (1..10).to_a.map do | i|
    User.create({
        email: "test#{i}@example.com",
        password: "asdf1234",
        password_confirmation: "asdf1234"
    })
end

posts = [
    { title: 'How do I tie my shoes', body: 'I need help' },
    { title: 'How often do I need to brush my teeth?', body: 'Also whats some good toothpaste' },
    { title: 'What do I eat for dinner', body: 'I am hungry' },
    { title: 'Which tea do you prefer', body: 'I like green tea' },
    { title: 'How do I improve my posture', body: 'I have a geek neck' }
]

users.each do |u|
    posts.each do |h|
        post = Users::Post.new(h)
        post.user = u
        post.save
    end
end