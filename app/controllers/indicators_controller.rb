class IndicatorsController < ApplicationController
  # Callback Methods
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]
  before_action :set_competencies_levels, only: [:new, :create, :edit, :update]

  # GET /indicators
  def index
    @competencies = Competency.all.alphabetical
  end

  # GET /indicators/:id
  def show
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)
    if @indicator.save
      flash[:notice] = "Successfully created #{@indicator.description}"
      redirect_to indicator_path(@indicator)
    else
      render "new"
    end
  end

  # GET /indicators/:id/edit
  def edit
  end

  # PATCH/PUT /indicators/:id
  def update
    if @indicator.update(indicator_params)
      flash[:notice] = "Successfully updated #{@indicator.description}"
      redirect_to indicator_path(@indicator)
    else
      render "edit"
    end
  end

  # DELETE /indicators/:id
  def destroy
    @indicator.destroy
    flash[:notice] = "Successfully deleted #{@indicator.description}"
    redirect_to indicators_path
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_indicator
    @indicator = Indicator.find(params[:id])
  end

  # Use callback to create the competencies and levels for forms
  def set_competencies_levels
    @active_competencies = Competency.active.alphabetical
    @active_levels = Level.active.alphabetical
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def indicator_params
    params.require(:indicator).permit(:competency_id, :level_id, :description, :active)
  end
end