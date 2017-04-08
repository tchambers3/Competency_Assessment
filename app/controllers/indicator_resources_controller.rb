class IndicatorResourcesController < ApplicationController

  # Callback Methods
  before_action :set_indicator_resource, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @indicator_resource = IndicatorResource.new
  end

  def create
    @indicator_resource = IndicatorResource.new(indicator_resource_params)
    if @indicator_resource.save
      flash[:notice] = ""
      @indicator = @indicator_resource.indicator
      # This assumes we add/delete IndicatorResources in the show indicator page
      redirect_to indicator_path(@indicator)
    else
      render "new"
    end
  end

  def edit
  end

  # This action is not necessary as the user will only ever be creating a new or destroying a mapping
  def update
  end

  def destroy
    @indicator = @indicator_resource
    @indicator_resource.destroy
    flash[:notice] = "Successfully deleted Indicator Resource mapping"
    redirect_to indicator_path(@indicator)
  end

  #----------------------------------
  private
  #----------------------------------

  def set_indicator_resource
    @indicator_resource = IndicatorResource.find(params[:id])
  end

  def indicator_resource_params
    params.require(:indicator_resource).permit(:indicator_id, :resource_id)
  end

end
