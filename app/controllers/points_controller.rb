class PointsController < ApplicationController
  before_action :set_point, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @q = Point.ransack(params[:q])
    @points = @q.result.page(params[:page]).per(5)
  end

  def search
    index
    render :index
  end
  
  def import
    begin
      Point.import(params[:file]) 
      redirect_to root_url
      flash[:success] = "Pontos importados com sucesso."
    rescue Exception => invalid
      redirect_to root_url
      flash[:error] = "Erro ao importar pontos. Verifique se os dados do arquivo estão corretos."
    end
  end

  def show
  end

  def new
    @point = Point.new
  end

  def edit
  end

  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { 
          redirect_to root_url
          flash[:success] = 'Ponto foi criado com sucesso.'
        }
      else
        format.html { render action: 'new' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { 
          redirect_to @point, 
          flash[:success] = 'Ponto foi atualizado com sucesso.'
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete

  end

  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end

  private
    def set_point
      @point = Point.find(params[:id])
    end

    def point_params
      params.require(:point).permit(:tipo, :rodovia, :sentido, :conservacao)
    end
end
