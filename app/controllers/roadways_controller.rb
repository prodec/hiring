class RoadwaysController < ApplicationController
  before_action :set_roadway, only: [:show, :edit, :update, :destroy]

  # GET /roadways
  # GET /roadways.json
  def index
    @search = Roadway.search(params[:q])
    @roadways = @search.result
  end

  def import

    erros = Roadway.import(params[:file])

    respond_to do |format|
      if erros.nil?
        format.html { redirect_to({action: "index"}, {notice: 'Roadway importado.'}) }
      else
        format.html { redirect_to({action: "index"}, {notice: "Roadway importado. As linhas: #{erros} não foram importadas pq tinham erros."}) }
      end
    end
  end

  # GET /roadways/1
  # GET /roadways/1.json
  def show
  end

  # GET /roadways/new
  def new
    @roadway = Roadway.new
  end

  # GET /roadways/1/edit
  def edit
  end

  # POST /roadways
  # POST /roadways.json
  def create
    #@roadway = Roadway.new(roadway_params)
    @roadway = Roadway.import(params[:file])

    respond_to do |format|
      if @roadway.save
        #format.html { redirect_to @roadway, notice: 'Roadway was successfully created.' }
        format.html { redirect_to({action: "index"}, {notice: 'Roadway was successfully created.'}) }
        format.json { render :show, status: :created, location: @roadway }
      else
        format.html { render :new }
        format.json { render json: @roadway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roadways/1
  # PATCH/PUT /roadways/1.json
  def update
    respond_to do |format|
      if @roadway.update(roadway_params)
        format.html { redirect_to @roadway, notice: 'Roadway was successfully updated.' }
        format.json { render :show, status: :ok, location: @roadway }
      else
        format.html { render :edit }
        format.json { render json: @roadway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roadways/1
  # DELETE /roadways/1.json
  def destroy
    @roadway.destroy
    respond_to do |format|
      format.html { redirect_to roadways_url, notice: 'Roadway was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roadway
      @roadway = Roadway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadway_params
      params.require(:roadway).permit(:file)
    end
end
