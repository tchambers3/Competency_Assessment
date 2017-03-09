# require compartmentalized context files
require "./test/sets/competency_contexts"


module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::CompetencyContexts
end