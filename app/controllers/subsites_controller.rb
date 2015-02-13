class SubsitesController < ApplicationController
  before_action :set_subsite, only: [:show, :edit, :update, :destroy]

  # GET /subsites
  # GET /subsites.json
  def index
    @subsites = Subsite.all
  end

  # GET /subsites/1
  # GET /subsites/1.json
  def show
  end

  # GET /subsites/new
  def new
    @subsite = Subsite.new
  end

  # GET /subsites/1/edit
  def edit
  end

  # POST /subsites
  # POST /subsites.json
  def create
    @subsite = Subsite.new(subsite_params)

    respond_to do |format|
      if @subsite.save
        format.html { redirect_to @subsite, notice: 'Subsite was successfully created.' }
        format.json { render :show, status: :created, location: @subsite }
      else
        format.html { render :new }
        format.json { render json: @subsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsites/1
  # PATCH/PUT /subsites/1.json
  def update
    respond_to do |format|
      if @subsite.update(subsite_params)
        format.html { redirect_to @subsite, notice: 'Subsite was successfully updated.' }
        format.json { render :show, status: :ok, location: @subsite }
      else
        format.html { render :edit }
        format.json { render json: @subsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsites/1
  # DELETE /subsites/1.json
  def destroy
    @subsite.destroy
    respond_to do |format|
      format.html { redirect_to subsites_url, notice: 'Subsite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsite
      @subsite = Subsite.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsite_params
      params.require(:subsite).permit(:name, :description)
    end
end
