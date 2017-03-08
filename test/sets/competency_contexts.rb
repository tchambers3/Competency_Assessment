module Contexts
  module CompetencyContexts

    # Create three competencies
    def create_competencies
      @communication = FactoryGirl.create(:competency)
      @decision_making = FactoryGirl.create(:competency, name: "Decision Making", 
        description: "The Decision Making competency will help you be more decisive in the future.")
      @problem_solving = FactoryGirl.create(:competency, name: "Problem Solving", 
        description: "Problem Solving will help with overall career growth.", active: false)
    end

    # Destroy the competency objects
    def remove_competencies
      @communication.destroy
      @decision_making.destroy
      @problem_solving.destroy
    end
    
  end
end