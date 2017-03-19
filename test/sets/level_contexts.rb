module Contexts
  module LevelContexts

    # Create four levels
    def create_levels
      @champion = FactoryGirl.create(:level)
      @contributer = FactoryGirl.create(:level, name: "Contributer", 
        description: "The middle level of indicators.", ranking: 2)
      @companion = FactoryGirl.create(:level, name: "Companion", 
        description: "The lowest level of indicators.", ranking: 3)
      @novice = FactoryGirl.create(:level, name: "Novice", 
        description: "The lowest level of indicators.", ranking: 4, active: false)
    end

    # Destroy the level objects
    def remove_levels
      @champion.destroy
      @contributer.destroy
      @companion.destroy
      @novice.destroy
    end
    
  end
end