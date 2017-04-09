module Contexts
  module LevelContexts

    # Create four levels
    def create_levels
      @champion = FactoryGirl.create(:level)
      @contributor = FactoryGirl.create(:level, name: "Contributor",
        description: "The middle level of indicators.", ranking: 2)
      @companion = FactoryGirl.create(:level, name: "Companion",
        description: "The lowest level of indicators.", ranking: 3)
      @novice = FactoryGirl.create(:level, name: "Novice",
        description: "The lowest level of indicators.", ranking: 4, active: false)
    end

    # Destroy the level objects
    def remove_levels
      @champion.destroy
      @contributor.destroy
      @companion.destroy
      @novice.destroy
    end

  end
end
