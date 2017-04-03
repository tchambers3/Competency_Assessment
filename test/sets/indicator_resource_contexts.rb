module Contexts
  module IndicatorResourceContexts

    # Create indicator resources
    def create_indicator_resources
      @indicator1_comm_dumm = FactoryGirl.create(:indicator_resource, indicator: @indicator1, resource: @comm_dumm)
      @indicator2_pub_speak = FactoryGirl.create(:indicator_resource, indicator: @indicator2, resource: @pub_speak)
      @indicator3_pub_speak = FactoryGirl.create(:indicator_resource, indicator: @indicator3, resource: @pub_speak)
      @indicator4_busi_success = FactoryGirl.create(:indicator_resource, indicator: @indicator4, resource: @busi_success)
      @indicator4_busi_failure = FactoryGirl.create(:indicator_resource, indicator: @indicator4, resource: @busi_failure)
      @indicator5_busi_success = FactoryGirl.create(:indicator_resource, indicator: @indicator5, resource: @busi_success)
    end

    # Destroy the indicator resource objects
    def remove_indicator_resources
      @indicator1_comm_dumm.destroy
      @indicator2_pub_speak.destroy
      @indicator3_pub_speak.destroy
      @indicator4_busi_success.destroy
      @indicator4_busi_failure.destroy
      @indicator5_busi_success.destroy
    end
    
  end
end