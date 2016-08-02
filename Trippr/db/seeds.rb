3.times do |i|
  User.create(email: "email#{i+1}", username: "username#{i+1}", password: "password#{i+1}")
end

3.times do |i|
  Event.create(title: "title#{i+1}", description: "description#{i+1}", creator_id: 1)
end

GuestEvent.create(user_id: 2, event_id: 1)
GuestEvent.create(user_id: 3, event_id: 1)

3.times do |i|
  Post.create(creator_id: 1,event_id: 1, body: "#{i+1} happen")
end

3.times do |i|
  Comment.create(post_id: 1, user_id: i+1, content: "comment#{i}", thumbs: 0)
end

