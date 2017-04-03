# require compartmentalized context files
require "./test/sets/competency_contexts"
require "./test/sets/level_contexts"
require "./test/sets/question_contexts"
require "./test/sets/indicator_contexts"
require "./test/sets/user_contexts"
require "./test/sets/paradigm_contexts"
require "./test/sets/resource_contexts"
require "./test/sets/indicator_question_contexts"
require "./test/sets/indicator_resource_contexts"

module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::CompetencyContexts
  include Contexts::LevelContexts
  include Contexts::QuestionContexts
  include Contexts::IndicatorContexts
  include Contexts::UserContexts
  include Contexts::ParadigmContexts
  include Contexts::ResourceContexts
  include Contexts::IndicatorQuestionContexts
  include Contexts::IndicatorResourceContexts
end
