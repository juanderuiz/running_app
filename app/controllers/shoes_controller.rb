class ShoesController < ApplicationController
  before_action :authenticate_runner!, except: [:main]
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_action :get_runner, except: [:main]

  # => protect_from_forgery except: :create #me daba un error de InvalidToken al subir la foto de la zapatilla

  # GET /shoes
  def main
    @shoes = Shoe.all
  end

  # GET /shoes
  # GET /shoes.json
  def index
    @shoe = Shoe.new #para la nueva zapatilla
    @shoes = @runner.shoes
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
    #@corredor = Runner.find(@shoe.runner_id)
    @entrenamientos = Training.where(shoe_id: @shoe.id).order(date: :desc)
    @totalentrenos = @entrenamientos.count
  end

  # GET /shoes/new
  def new
    #@shoe = Shoe.new
    redirect_to runner_shoes_path
  end


  # GET /shoes/1/edit
  def edit
    #Aqui no pongo nada? En el Screencast de devise1 tiene codigo, ver 9:37
  end

  # POST /shoes
  # POST /shoes.json
  def create
    #shoe_params[:runner_id] = current_runner.id #Cojo el id del runner logueado
    #@shoe = Shoe.new(shoe_params)
    #@shoe.runner_id = current_runner.id
    @shoe = @runner.shoes.new(shoe_params)   

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to runner_shoes_path, notice: 'Zapatilla creada satisfactoriamente.' }
        format.json { render action: 'index', status: :created, location: @shoe }
      else
        format.html { render action: 'new' }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /shoes/1
  # PATCH/PUT /shoes/1.json
  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to runner_shoes_path, notice: 'Zapatilla actualizada satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  # DELETE /shoes/1.json
  def destroy
    entrenos = Training.where(shoe_id: @shoe.id) #Busca los entrenos de esa zapatilla por si...
    if @shoe.destroy
      entrenos.each do |e| #pongo shoe a NIL en cada entreno de la zapatilla borrada
        e.shoe_id = nil 
        e.save
      end  
    end
    respond_to do |format|
      format.html { redirect_to runner_shoes_path }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoe_params
      params.require(:shoe).permit(:nombre, :totalkms, :avatar) #he quitado :runner_id
    end

    def get_runner
      @runner = Runner.find(params[:runner_id])
    end
end
