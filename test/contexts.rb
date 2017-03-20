# require compartmentalized context files
require "./test/sets/competency_contexts"
require "./test/sets/level_contexts"
require "./test/sets/question_contexts"
<<<<<<< HEAD
=======
require "./test/sets/indicator_contexts"

>>>>>>> development

module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::CompetencyContexts
  include Contexts::LevelContexts
  include Contexts::QuestionContexts
<<<<<<< HEAD
=======
  include Contexts::IndicatorContexts
>>>>>>> development
end
