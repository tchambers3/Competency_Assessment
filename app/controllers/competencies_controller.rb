class CompetenciesController < ApplicationController
  # Callback Methods
  before_action :set_competency, only: [:show, :edit, :update, :destroy]

  # GET /competencies
  def index
    @active_competencies = Competency.active.alphabetical
    @inactive_competencies = Competency.inactive.alphabetical
  end

  # GET /competencies/1
  def show
  end

  # GET /competencies/new
  def new
    @competency = Competency.new
  end

  # POST /competencies
  def create
    @competency = Competency.new(competency_params)
    if @competency.save
      redirect_to competency_path(@competency), notice: "Successfully created #{@competency.name}"
    else
      render "new"
    end
  end

  # GET /competencies/1/edit
  def edit
  end

  # PATCH/PUT /competencies/1
  def update
    if @competency.update(competency_params)
      redirect_to competency_path(@competency), notice: "Successfully updated #{@competency.name}"
    else
      render "edit"
    end
  end

  # DELETE /competencies/1
  def destroy
    @competency.destroy
    redirect_to competencies_url, notice: "Successfully deleted #{@competency.name}"
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_competency
    @competency = Competency.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def competency_params
    params.require(:competency).permit(:name, :description, :active)
  end
end