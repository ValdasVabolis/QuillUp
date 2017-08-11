def seed_development
  users = (1..10).to_a.map do |i|
    User.create({
      username: Faker::Name.unique.name.gsub(/[\s\.\']/, ''),
      email: Faker::Internet.unique.email,
      password: "asdf1234",
      password_confirmation: "asdf1234",
      confirmed_at: DateTime.now
    })
  end

  users << User.create({
    username: 'test',
    email: 'test@test.com',
    password: "testtest",
    password_confirmation: "testtest",
    confirmed_at: DateTime.now
  })

  def questions
    [ { title: "How do I tie my shoes?", body: "Hello, Quill! I got brand new Nike shoes for my birthday, however, I realized that I do not know how to use shoelaces. It is really embarrassing and I do not want my mother to find out. Do you have any tips on how to learn this skill quickly. What are some good techniques? Thank you. " },
      { title: "How often do I need to brush my teeth?", body: "Also whats some good toothpaste" },
      { title: "What does this weird Latin text mean?", body: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Et harumd und lookum like Greek to me, dereud facilis est er expedit distinct. Nam liber te conscient to factor tum poen legum odioque civiuda. Et tam neque pecun modut est neque nonor et imper ned libidig met, consectetur adipiscing elit, sed ut labore et dolore magna aliquam makes one wonder who would ever read this stuff? Bis nostrud exercitation ullam mmodo consequet. Duis aute in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Et varem mullti eos et accusam dignissum qui blandit est praesent luptatum delenit aigue excepteur sint occae. Et harumd dereud facilis est er expedit distinct. Nam libe soluta nobis eligent optio est congue nihil impedit doming id Lorem ipsum dolor sit amet, consectetur adipiscing elit, set eiusmod tempor incidunt et labore et dolore magna aliquam. Ut enim ad minim veniam, quis nostrud exerc. Irure dolor in reprehend incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse molestaie cillum. Tia non ob ea soluad incommod quae egen ium improb fugiend. Officia deserunt mollit anim id est laborum Et harumd dereud facilis est er expedit distinct. " },
      { title: "Which tea do you prefer", body: "I like green tea, however, it is hard to sleep at night when I drink too much of it. What tea do you drink? Leave a comment below." },
      { title: "How do I improve my posture", body: "I have a geek neck and my back hurts a lot when I am sitting in front of my computer. Are there are any good exercises to help me with this issue? Any help would be appreciated, thanks!" },
      { title: "I'm leaving Quill.", body: "Today I'm leaving Quill. I was a member of Quill community for 2 weeks but today I am leaving and this is why: 1) The comment section. What the hell? A bunch of stupid comments get to the top while the intelligent and well thought out ones get buried deep in the comment section. That is so unfair. 2) The admins. Admins of Quill are censoring free speech, banning users and harvesting private user data. COMPLETELY UNACCEPTABLE. It was nice knowing all of you, but today is the day when I'm moving on. Have a wonderful day."}
    ]
  end

  def answers
    [ { body: "Lawyer up. Hit the gym. Delete facebook." },
      { body: "me too thanks" },
      { body: "Do you even know how Rails works? " },
      { body: "Learn python first, then C/C++" },
      { body: "Honestly, I dont think you should use thenewboston, its a terrible resource" },
      { body: "Sometimes people don't want to hear the truth because they don't want their illusions destroyed." },
      { body: "There are two different types of people in the world, those who want to know, and those who want to believe." },
      { body: "I was in darkness, but I took three steps and found myself in paradise. The first step was a good thought, the second, a good word; and the third, a good deed." },
      { body: "It is not the strengths, but the durations of great sentiments that make great men." },
      { body: "The individual has always had to struggle to keep from being overwhelmed by the tribe. If you try it, you will be lonely often, and sometimes frightened. But no price is too high to pay for the privilege of owning yourself." },
      { body: "Sometimes in our relationship to another human being the proper balance of friendship is restored when we put a few grains of impropriety onto our own side of the scale." },
      { body: "What, if some day or night a demon were to steal after you into your loneliest loneliness and say to you: 'This life as you now live it and have lived it, you will have to live once more and innumerable times more' ... Would you not throw yourself down and gnash your teeth and curse the demon who spoke thus? Or have you once experienced a tremendous moment when you would have answered him: 'You are a god and never have I heard anything more divine." },
      { body: "Consider the cattle, grazing as they pass you by. They do not know what is meant by yesterday or today, they leap about, eat, rest, digest, leap about again, and so from morn till night and from day to day, fettered to the moment and its pleasure or displeasure, and thus neither melancholy nor bored. [...] A human being may well ask an animal: 'Why do you not speak to me of your happiness but only stand and gaze at me?' The animal would like to answer, and say, 'The reason is I always forget what I was going to say' - but then he forgot this answer too, and stayed silent." },
      { body: "There will always be rocks in the road ahead of us. They will be stumbling blocks or stepping stones; it all depends on how you use them." },
      { body: "You have your way. I have my way. As for the right way, the correct way, and the only way, it does not exist." },
      { body: "Do you want to have an easy life? Then always stay with the herd and lose yourself in the herd." },
      { body: "It is not a lack of love, but a lack of friendship that makes unhappy marriages." },
      { body: "The man loves danger and sport. That is why he loves woman, the most dangerous of all sports." },
      { body: "Invisible threads are the strongest ties." },
      { body: "Love your enemies because they bring out the best in you." },
      { body: "I know of no better life purpose than to perish in attempting the great and the impossible." },
      { body: "One must still have chaos in oneself to be able to give birth to a dancing star." },
      { body: "Enjoy life. This is not a dress rehearsal." },
      { body: "I and me are always too deeply in conversation." },
      { body: "The true man wants two things: danger and play. For that reason he wants woman, as the most dangerous plaything." },
      { body: "There are no beautiful surfaces without a terrible depth." },
      { body: "One must learn to love oneself with a wholesome and healthy love, so that one can bear to be with oneself and need not roam." },
      { body: "Nobody is more inferior than those who insist on being equal." },
      { body: "The snake which cannot cast its skin has to die. As well the minds which are prevented from changing their opinions; they cease to be mind." }
    ]
  end

  def reply_to_question(question)
   question_answers = []
   Random.rand(1..20).times do |n|
     puts "creating reply #{n} for question..."
     answer = Answer.new({
       question: question,
       user: User.all.sample,
       body: answers.sample[:body]
     })
     question_answers << answer
   end
   question.answers = question_answers
  end

  users.each do |u|
   questions.each.with_index do |h, i|
     puts "creating question #{i}..."
     question = Question.new(h)
     question.user = u
     reply_to_question(question)
     question.save
   end
 end
end

seed_development if Rails.env.development?