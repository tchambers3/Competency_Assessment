# require compartmentalized context files
require "./test/sets/competency_contexts"
require "./test/sets/level_contexts"
require "./test/sets/question_contexts"
require "./test/sets/indicator_contexts"
require "./test/sets/user_contexts"

module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::CompetencyContexts
  include Contexts::LevelContexts
  include Contexts::QuestionContexts
  include Contexts::IndicatorContexts
  include Contexts::UserContexts
end
