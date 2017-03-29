class ResourcesController < ApplicationController
  # Callback Methods
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  def index
    @active_resources = Resource.active.alphabetical
    @inactive_resources = Resource.inactive.alphabetical
  end

  # GET /resources/:id
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:notice] = "Successfully created #{@resource.title}"
      redirect_to resource_path(@resource)
    else
      render "new"
    end
  end

  # GET /resources/:id/edit
  def edit
  end

  # PATCH/PUT /resources/:id
  def update
    if @resource.update(resource_params)
      flash[:notice] = "Successfully updated #{@resource.title}"
      redirect_to resource_path(@resource)
    else
      render "edit"
    end
  end

  # DELETE /resources/:id
  def destroy
    @resource.destroy
    flash[:notice] = "Successfully deleted #{@resource.title}"
    redirect_to resources_path
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:resource).permit(:resource, :active)
  end
end
