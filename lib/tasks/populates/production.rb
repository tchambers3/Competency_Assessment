# For production environment only populate these models:
# Level, Paradigm, User

# Step 1: Create Levels
levels =
  [
    ["Champion", "The highest level of indicators.", 1, true],
    ["Contributor", "The middle level of indicators.", 2, true],
    ["Companion", "The lowest level of indicators.", 3, true]
  ]

levels.each do |level|
  l = Level.new
  l.name = level[0]
  l.description = level[1]
  l.ranking = level[2]
  l.active = level[3]
  l.save!
end

# Step 2: Create Paradigms
paradigms =
  [
    ["Build Understanding", "Books that help you understand what you're buildling", 1, true],
    ["Get Connected", "Workshops for you to try live!", 2, true],
    ["Do Something", "Actionable ways to better you", 3, true],
    ["Learn More", "Watch educational videos", 4, true]
  ]

paradigms.each do |paradigm|
  p = Paradigm.new
  p.name = paradigm[0]
  p.description = paradigm[1]
  p.ranking = paradigm[2]
  p.active = paradigm[3]
  p.save!
end

# Step 3: Create an Admin
users =
  [
    ["admin", "password", "password", true]
  ]

users.each do |user|
  u = User.new
  u.username = user[0]
  u.password = user[1]
  u.password_confirmation = user[2]
  u.active = user[3]
  u.save!
end
