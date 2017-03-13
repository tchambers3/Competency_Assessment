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