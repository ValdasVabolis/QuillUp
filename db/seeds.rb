def seed_development
    users = (1..10).to_a.map do | i|
        User.create({
            email: "test#{i}@example.com",
            password: "asdf1234",
            password_confirmation: "asdf1234"
        })
    end

    posts = [
        { title: 'How do I tie my shoes?', body: 'Hello, Quill! I got brand new Nike shoes for my birthday, however, I realized that I do not know how to use shoelaces. It is really embarrassing and I do not want my mother to find out. Do you have any tips on how to learn this skill quickly. What are some good techniques? Thank you. ' },
        { title: 'How often do I need to brush my teeth?', body: 'Also whats some good toothpaste' },
        { title: 'What does this weird Latin text mean?', body: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Et harumd und lookum like Greek to me, dereud facilis est er expedit distinct. Nam liber te conscient to factor tum poen legum odioque civiuda. Et tam neque pecun modut est neque nonor et imper ned libidig met, consectetur adipiscing elit, sed ut labore et dolore magna aliquam makes one wonder who would ever read this stuff? Bis nostrud exercitation ullam mmodo consequet. Duis aute in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Et varem mullti eos et accusam dignissum qui blandit est praesent luptatum delenit aigue excepteur sint occae. Et harumd dereud facilis est er expedit distinct. Nam libe soluta nobis eligent optio est congue nihil impedit doming id Lorem ipsum dolor sit amet, consectetur adipiscing elit, set eiusmod tempor incidunt et labore et dolore magna aliquam. Ut enim ad minim veniam, quis nostrud exerc. Irure dolor in reprehend incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse molestaie cillum. Tia non ob ea soluad incommod quae egen ium improb fugiend. Officia deserunt mollit anim id est laborum Et harumd dereud facilis est er expedit distinct. " },
        { title: 'Which tea do you prefer', body: 'I like green tea, however, it is hard to sleep at night when I drink too much of it. What tea do you drink? Leave a comment below.' },
        { title: 'How do I improve my posture', body: 'I have a geek neck and my back hurts a lot when I am sitting in front of my computer. Are there are any good exercises to help me with this issue? Any help would be appreciated, thanks!' }
    ]

    comments = [
        {  body: 'Lawyer up. Hit the gym. Delete facebook.' },
        {  body: 'me too thanks' },
        {  body: 'Do you even know how Rails works? ' },
        {  body: 'Learn python first, then C/C++' },
        {  body: 'Honestly, I dont think you should use thenewboston, its a terrible resource' }
    ]

    users.each do |u|
        posts.each do |h|
            post = Post.new(h)
            post.user = u
            post.comments = comments.map do |kv|
              comment = Comment.new(kv)
              comment.user = User.all.sample
              comment
            end
            post.save
        end
    end
end

seed_development if Rails.env.development?