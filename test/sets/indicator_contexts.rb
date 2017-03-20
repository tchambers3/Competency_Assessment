module Contexts
  module IndicatorContexts

    # Create five indicator objects
    def create_indicators
      @indicator1 = FactoryGirl.create(:indicator, competency: @communication, level: @companion)
      @indicator2 = FactoryGirl.create(:indicator, competency: @communication, level: @contributer,
        description: "Able to present written communication in an easy–to-read format.")
      @indicator3 = FactoryGirl.create(:indicator, competency: @communication, level: @champion, 
        description: "Engages in difficult conversations with others while maintaining respect.")
      @indicator4 = FactoryGirl.create(:indicator, competency: @decision_making, level: @companion, 
        description: "Able to outline a plan to gather data that will aid in the completion of a familiar task.")
      @indicator5 = FactoryGirl.create(:indicator, competency: @problem_solving, level: @contributer, 
        description: "Able to identify apparent causes of a problem.", active: false)
    end

    # Destroy the indicator objects
    def remove_indicators
      @indicator1.destroy
      @indicator2.destroy
      @indicator3.destroy
      @indicator4.destroy
      @indicator5.destroy
    end
    
  end
end