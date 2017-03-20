# Step 1: Create the Competencies
competencies =
  [
    ["Communication", "Take the Communication assessment to see how well you perform in the Communication Competency.", true],
    ["Decision Making", "The Decision Making competency will help you be more decisive in the future.", true],
    ["Utilizing Technology", "The Utilizing Technology competency will help you be more prepared with using technological tools.", false]
  ]
competencies.each do |competency|
  c = Competency.new
  c.name = competency[0]
  c.description = competency[1]
  c.active = competency[2]
  c.save!
end

# Step 2: Create the Levels
levels =
  [
    ["Champion", "The highest level of indicators.", 1, true],
    ["Contributer", "The middle level of indicators.", 2, true],
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

# Step 3: Create the Indicators
indicators =
[
  ["Able to organize own thoughts and outline intended meaning of a message", 1, 3, true],
  ["Able to identify and may employ active listening skills", 1, 3, true],
  ["Able to identify common nonverbal cues", 1, 3, true],
  ["Able to identify various media used to deliver messages", 1, 3, true],
  ["Able to comprehend the content of oral and written messages by applying personal context to interpret the meaning", 1, 3, true],
  ["Able to present simple, familiar information to familiar audiences by using preferred method of communication", 1, 3, true],
  ["Able to present intentions and ideas to a familiar individual when prompted by the individual", 1, 3, true],
  ["Able to select the most appropriate medium of communication to deliver a menaningful message", 1, 2, true],
  ["Able to clearly and concisely deliver the meaning of a message using various media", 1, 2, true],
  ["Able to actively listen to others and clarify the meaning of a message", 1, 2, true],
  ["Able to evaluate previous interactions and develop a communication strategy to accommodate audience's preferences", 1, 2, true],
  ["Able to present written communication in an easy-to-read format", 1, 2, true],
  ["Able to articulate intentions, ideas, and feelings to a large group", 1, 2, true],
  ["Able to articulate thoughts using proper grammer in written and verbal form", 1, 2, true],
  ["Able to deliver an informational message which encourages others to take action", 1, 2, true],
  ["Able to evaluate the environment and/or audience to determine the most appropriate medium for delivering a meaningful message", 1, 1, true],
  ["Able to determine the effectiveness of a chosen medium in delivering a message", 1, 1, true],
  ["Able to deliver an inspiring and informative message regarding departmental and/or organizational objectives using multiple modes of communication", 1, 1, true],
  ["Able to paraphrase or extract meaning from others' communication", 1, 1, true],
  ["Able to identify and interpret nonverbal cues", 1, 1, true],
  ["Able to adjust communication approach while delivering a message by analyzing the audience's verbal and nonverbal cues", 1, 1, true],
  ["Able to encourage others to openly and clearly express intentions and ideas", 1, 1, true],
  ["Able to help others develop appropriate and effective communication strategies", 1, 1, true],
  ["Able to clarify complex information into simple, easy-to-understand terms and translate complex concepts for a broader audience", 1, 1, true]
]

indicators.each do |indicator|
  i = Indicator.new
  i.description = indicator[0]
  i.competency_id = indicator[1]
  i.level_id = indicator[2]
  i.active = indicator[3]
  i.save!
end

#Step 4: Create Questions
questions =
[
  ["When I have something to say, I prepare by organizing my thoughts and outlining my intention.",1,true],
  ["I pay attention and focus when someone is talking to me.",2,true],
  ["I can recognize non-verbal cues from others.",3,true],
  ["When given direction by my supervisor, I understand what is being asked of me.",4,true],
  ["I am able to present information to others in a clear and concise manner.",5,true],
  ["When I don't understand something, I am able to resolve by asking clarifying questions.",6,true],
  ["After interacting with an individual, I am able to tailor my communication style to meet his/her needs.",7,true],
  ["My written communication is clear and concise.",8,true],
  ["My written communication is free of grammatical errors.",9,true],
  ["I am able to give direction that prompts the requested action.",10,true],
  ["I am able to gauge my audience and know which communication method to use.",11,true],
  ["I am able to paraphrase or restate a message I have received with accuracy.",12,true],
  ["I am able to adjust my message in response to the non-verbal cues I receive.",13,true],
  ["I encourage others to share their ideas and opinions.",14,true],
  ["I can translate complex concepts into easy-to-understand ideas and information.",15,true],
  ["I can inspire others by communicating a vision or plan.",16,true]
]

questions.each do |question|
  q = Question.new
  q.question = question[0]
  q.question_number = question[1]
  q.active = question[2]
  q.save!
end

#Step 5: Create users
users =
[
  ["admin","password",true]
]

users.each do |user|
  u = User.new
  u.username = user[0]
  u.password = user[1]
  u.active = user[2]
  u.save!
end
